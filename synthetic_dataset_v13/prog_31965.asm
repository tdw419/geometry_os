; DESCRIPTION: Composite: Sets a single cyan pixel at (370, 235) then Places a white circle of radius 14 at center (384, 51) then Renders a black line between points (149, 16) and (371, 77).
; PLAN: r0=370(x), r1=235(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=51(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x1), r11=16(y1), r12=371(x2), r13=77(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 235
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 51
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 16
LDI r12, 371
LDI r13, 77
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
