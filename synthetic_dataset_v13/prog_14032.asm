; DESCRIPTION: Composite: Renders a cyan disk with center (232, 144) and radius 50 then Draws a red rectangle at (222, 169) with width 41 and height 12 then Sets a single purple pixel at (374, 207).
; PLAN: r0=232(x), r1=144(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=169(y), r7=41(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=207(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 144
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 169
LDI r7, 41
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 207
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
