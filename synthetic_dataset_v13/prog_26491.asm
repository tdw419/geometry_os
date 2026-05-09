; DESCRIPTION: Composite: Places a black 118x62 rectangle at position (235, 61) then Creates a white circular shape at (71, 77) with radius 14 then Draws a cyan line from (458, 234) to (58, 193).
; PLAN: r0=235(x), r1=61(y), r2=118(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=77(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x1), r11=234(y1), r12=58(x2), r13=193(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 61
LDI r2, 118
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 77
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 234
LDI r12, 58
LDI r13, 193
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
