; DESCRIPTION: Composite: Creates a white circular shape at (215, 132) with radius 77 then Places a black dot at position (438, 148) then Draws a white line from (36, 169) to (86, 102).
; PLAN: r0=215(x), r1=132(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=148(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=36(x1), r11=169(y1), r12=86(x2), r13=102(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 132
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 148
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 36
LDI r11, 169
LDI r12, 86
LDI r13, 102
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
