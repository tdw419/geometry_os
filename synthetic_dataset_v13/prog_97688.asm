; DESCRIPTION: Composite: Places a yellow line segment connecting (151, 131) to (181, 235) then Creates a green circular shape at (250, 138) with radius 46.
; PLAN: r0=151(x1), r1=131(y1), r2=181(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=138(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 131
LDI r2, 181
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 138
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
