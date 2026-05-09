; DESCRIPTION: Composite: Places a white circle of radius 19 at center (148, 159) then Sets a single white pixel at (27, 212) then Renders a red line between points (138, 96) and (401, 101).
; PLAN: r0=148(x), r1=159(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=212(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=138(x1), r11=96(y1), r12=401(x2), r13=101(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 159
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 212
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 96
LDI r12, 401
LDI r13, 101
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
