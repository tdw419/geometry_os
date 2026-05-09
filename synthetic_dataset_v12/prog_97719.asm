; DESCRIPTION: Composite: Sets a single blue pixel at (126, 128) then Draws a orange line from (79, 64) to (76, 206) then Creates a white rectangular region at (252, 167) spanning 62 by 28 pixels.
; PLAN: r0=126(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=64(y1), r7=76(x2), r8=206(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=167(y), r12=62(width), r13=28(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 64
LDI r7, 76
LDI r8, 206
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 167
LDI r12, 62
LDI r13, 28
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
