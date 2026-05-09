; DESCRIPTION: Composite: Renders a white line between points (255, 191) and (448, 171) then Creates a black circular shape at (217, 128) with radius 52 then Places a white dot at position (220, 235).
; PLAN: r0=255(x1), r1=191(y1), r2=448(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=128(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x), r11=235(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 191
LDI r2, 448
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 128
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 235
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
