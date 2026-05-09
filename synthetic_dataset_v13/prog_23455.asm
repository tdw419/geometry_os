; DESCRIPTION: Composite: Places a black line segment connecting (102, 234) to (94, 29) then Creates a white circular shape at (88, 176) with radius 71 then Places a cyan dot at position (64, 133).
; PLAN: r0=102(x1), r1=234(y1), r2=94(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=176(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=133(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 102
LDI r1, 234
LDI r2, 94
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 176
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 133
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
