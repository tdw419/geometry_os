; DESCRIPTION: Composite: Draws a cyan rectangle at (69, 32) with width 106 and height 62 then Renders a cyan line between points (270, 173) and (325, 13) then Sets a single orange pixel at (93, 71).
; PLAN: r0=69(x), r1=32(y), r2=106(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x1), r6=173(y1), r7=325(x2), r8=13(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=71(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 32
LDI r2, 106
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 173
LDI r7, 325
LDI r8, 13
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 71
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
