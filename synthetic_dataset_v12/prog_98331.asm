; DESCRIPTION: Composite: Draws a green line from (260, 235) to (179, 239) then Draws a black circle centered at (354, 109) with radius 75.
; PLAN: r0=260(x1), r1=235(y1), r2=179(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=109(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 235
LDI r2, 179
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 109
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
