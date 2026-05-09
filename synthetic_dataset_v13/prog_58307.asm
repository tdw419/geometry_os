; DESCRIPTION: Composite: Places a yellow line segment connecting (184, 130) to (325, 129) then Creates a white circular shape at (141, 114) with radius 47.
; PLAN: r0=184(x1), r1=130(y1), r2=325(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=114(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 130
LDI r2, 325
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 114
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
