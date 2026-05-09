; DESCRIPTION: Composite: Places a green line segment connecting (341, 21) to (477, 171) then Places a blue circle of radius 51 at center (214, 101).
; PLAN: r0=341(x1), r1=21(y1), r2=477(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=101(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 21
LDI r2, 477
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 101
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
