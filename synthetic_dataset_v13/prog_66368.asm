; DESCRIPTION: Composite: Renders a white disk with center (291, 62) and radius 48 then Places a blue line segment connecting (506, 58) to (221, 0).
; PLAN: r0=291(x), r1=62(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x1), r6=58(y1), r7=221(x2), r8=0(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 62
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 58
LDI r7, 221
LDI r8, 0
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
