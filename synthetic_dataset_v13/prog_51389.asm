; DESCRIPTION: Composite: Sets a single white pixel at (329, 154) then Renders a blue box of size 65x120 starting at (140, 57) then Draws a orange line from (396, 158) to (419, 185).
; PLAN: r0=329(x), r1=154(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=57(y), r7=65(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x1), r11=158(y1), r12=419(x2), r13=185(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 154
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 57
LDI r7, 65
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 158
LDI r12, 419
LDI r13, 185
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
