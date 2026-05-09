; DESCRIPTION: Composite: Sets a single black pixel at (251, 235) then Renders a blue box of size 57x112 starting at (85, 62) then Draws a cyan circle centered at (293, 147) with radius 80.
; PLAN: r0=251(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=62(y), r7=57(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x), r11=147(y), r12=80(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 85
LDI r6, 62
LDI r7, 57
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 147
LDI r12, 80
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
