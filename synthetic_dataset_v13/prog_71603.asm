; DESCRIPTION: Composite: Draws a cyan circle centered at (371, 64) with radius 34 then Places a black dot at position (233, 199) then Places a white line segment connecting (78, 74) to (108, 137).
; PLAN: r0=371(x), r1=64(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=78(x1), r11=74(y1), r12=108(x2), r13=137(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 64
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 78
LDI r11, 74
LDI r12, 108
LDI r13, 137
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
