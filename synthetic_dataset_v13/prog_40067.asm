; DESCRIPTION: Composite: Places a cyan line segment connecting (47, 43) to (511, 25) then Creates a blue circular shape at (125, 204) with radius 40.
; PLAN: r0=47(x1), r1=43(y1), r2=511(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=204(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 43
LDI r2, 511
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 204
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
