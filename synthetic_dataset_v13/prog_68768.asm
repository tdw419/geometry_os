; DESCRIPTION: Composite: Places a yellow dot at position (231, 210) then Places a magenta line segment connecting (203, 64) to (499, 38) then Creates a magenta rectangular region at (429, 88) spanning 22 by 103 pixels.
; PLAN: r0=231(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=203(x1), r6=64(y1), r7=499(x2), r8=38(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=88(y), r12=22(width), r13=103(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 210
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 203
LDI r6, 64
LDI r7, 499
LDI r8, 38
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 88
LDI r12, 22
LDI r13, 103
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
