; DESCRIPTION: Composite: Renders a black line between points (304, 91) and (234, 4) then Renders a black disk with center (428, 161) and radius 19.
; PLAN: r0=304(x1), r1=91(y1), r2=234(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=161(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 91
LDI r2, 234
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 161
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
