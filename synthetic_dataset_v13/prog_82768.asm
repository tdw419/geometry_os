; DESCRIPTION: Composite: Places a white circle of radius 69 at center (307, 185) then Sets a single orange pixel at (34, 154) then Renders a white line between points (485, 189) and (123, 30).
; PLAN: r0=307(x), r1=185(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=154(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=485(x1), r11=189(y1), r12=123(x2), r13=30(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 185
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 154
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 485
LDI r11, 189
LDI r12, 123
LDI r13, 30
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
