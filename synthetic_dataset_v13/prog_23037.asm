; DESCRIPTION: Composite: Renders a magenta line between points (185, 233) and (83, 127) then Draws a yellow rectangle at (248, 210) with width 88 and height 22 then Sets a single red pixel at (28, 173).
; PLAN: r0=185(x1), r1=233(y1), r2=83(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=210(y), r7=88(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x), r11=173(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 233
LDI r2, 83
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 210
LDI r7, 88
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 173
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
