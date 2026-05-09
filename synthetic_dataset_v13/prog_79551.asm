; DESCRIPTION: Composite: Draws a black circle centered at (278, 98) with radius 29 then Places a black line segment connecting (371, 91) to (463, 227).
; PLAN: r0=278(x), r1=98(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=91(y1), r7=463(x2), r8=227(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 98
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 91
LDI r7, 463
LDI r8, 227
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
