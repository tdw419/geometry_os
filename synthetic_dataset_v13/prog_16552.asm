; DESCRIPTION: Composite: Draws a green circle centered at (285, 179) with radius 44 then Places a black dot at position (398, 94) then Places a cyan line segment connecting (291, 20) to (484, 103).
; PLAN: r0=285(x), r1=179(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=291(x1), r11=20(y1), r12=484(x2), r13=103(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 179
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 291
LDI r11, 20
LDI r12, 484
LDI r13, 103
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
