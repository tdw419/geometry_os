; DESCRIPTION: Composite: Creates a blue circular shape at (399, 120) with radius 46 then Sets a single green pixel at (113, 140) then Draws a blue line from (332, 172) to (462, 89).
; PLAN: r0=399(x), r1=120(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=140(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=332(x1), r11=172(y1), r12=462(x2), r13=89(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 120
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 140
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 332
LDI r11, 172
LDI r12, 462
LDI r13, 89
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
