; DESCRIPTION: Composite: Sets a single blue pixel at (12, 235) then Creates a cyan circular shape at (272, 72) with radius 35 then Places a white line segment connecting (215, 199) to (299, 165).
; PLAN: r0=12(x), r1=235(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=72(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x1), r11=199(y1), r12=299(x2), r13=165(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 235
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 72
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 199
LDI r12, 299
LDI r13, 165
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
