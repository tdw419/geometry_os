; DESCRIPTION: Composite: Draws a white line from (374, 42) to (203, 52) then Places a blue 71x36 rectangle at position (31, 164) then Creates a magenta circular shape at (184, 172) with radius 32.
; PLAN: r0=374(x1), r1=42(y1), r2=203(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=164(y), r7=71(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=172(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 42
LDI r2, 203
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 164
LDI r7, 71
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 172
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
