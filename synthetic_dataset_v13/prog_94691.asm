; DESCRIPTION: Composite: Places a white dot at position (507, 126) then Places a orange line segment connecting (260, 179) to (428, 242) then Creates a cyan rectangular region at (438, 137) spanning 38 by 89 pixels.
; PLAN: r0=507(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=260(x1), r6=179(y1), r7=428(x2), r8=242(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=438(x), r11=137(y), r12=38(width), r13=89(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 179
LDI r7, 428
LDI r8, 242
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 137
LDI r12, 38
LDI r13, 89
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
