; DESCRIPTION: Composite: Places a white circle of radius 64 at center (274, 88) then Places a white line segment connecting (488, 86) to (453, 87).
; PLAN: r0=274(x), r1=88(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x1), r6=86(y1), r7=453(x2), r8=87(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 88
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 86
LDI r7, 453
LDI r8, 87
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
