; DESCRIPTION: Composite: Draws a orange line from (34, 247) to (261, 199) then Places a yellow circle of radius 26 at center (292, 177) then Places a white 23x107 rectangle at position (317, 145).
; PLAN: r0=34(x1), r1=247(y1), r2=261(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=177(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=317(x), r11=145(y), r12=23(width), r13=107(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 247
LDI r2, 261
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 177
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 317
LDI r11, 145
LDI r12, 23
LDI r13, 107
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
