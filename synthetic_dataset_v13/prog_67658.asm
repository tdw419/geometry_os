; DESCRIPTION: Composite: Renders a white disk with center (414, 64) and radius 36 then Places a blue line segment connecting (80, 116) to (52, 35).
; PLAN: r0=414(x), r1=64(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x1), r6=116(y1), r7=52(x2), r8=35(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 64
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 116
LDI r7, 52
LDI r8, 35
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
