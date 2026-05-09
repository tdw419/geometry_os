; DESCRIPTION: Composite: Places a white line segment connecting (9, 250) to (474, 196) then Places a purple circle of radius 79 at center (165, 87).
; PLAN: r0=9(x1), r1=250(y1), r2=474(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=87(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 250
LDI r2, 474
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 87
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
