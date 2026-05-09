; DESCRIPTION: Composite: Places a yellow line segment connecting (494, 223) to (445, 29) then Creates a green circular shape at (436, 185) with radius 43.
; PLAN: r0=494(x1), r1=223(y1), r2=445(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=185(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 223
LDI r2, 445
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 185
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
