; DESCRIPTION: Composite: Places a black line segment connecting (23, 107) to (200, 61) then Places a white circle of radius 29 at center (299, 227).
; PLAN: r0=23(x1), r1=107(y1), r2=200(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=227(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 107
LDI r2, 200
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 227
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
