; DESCRIPTION: Composite: Renders a cyan box of size 63x44 starting at (374, 136) then Draws a cyan line from (76, 123) to (144, 120) then Sets a single purple pixel at (214, 75).
; PLAN: r0=374(x), r1=136(y), r2=63(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=123(y1), r7=144(x2), r8=120(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=75(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 136
LDI r2, 63
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 123
LDI r7, 144
LDI r8, 120
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 75
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
