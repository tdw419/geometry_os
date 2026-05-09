; DESCRIPTION: Composite: Draws a white line from (409, 33) to (158, 104) then Sets a single white pixel at (262, 168) then Renders a yellow disk with center (169, 168) and radius 74.
; PLAN: r0=409(x1), r1=33(y1), r2=158(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=168(y), r12=74(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 33
LDI r2, 158
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 169
LDI r11, 168
LDI r12, 74
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
