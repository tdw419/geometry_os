; DESCRIPTION: Composite: Places a black dot at position (22, 20) then Creates a white circular shape at (400, 135) with radius 28 then Places a white line segment connecting (383, 3) to (500, 114).
; PLAN: r0=22(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=135(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x1), r11=3(y1), r12=500(x2), r13=114(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 135
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 3
LDI r12, 500
LDI r13, 114
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
