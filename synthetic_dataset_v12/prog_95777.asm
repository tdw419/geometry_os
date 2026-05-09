; DESCRIPTION: Composite: Renders a orange box of size 64x101 starting at (305, 70) then Places a magenta line segment connecting (14, 147) to (421, 159) then Sets a single green pixel at (400, 67).
; PLAN: r0=305(x), r1=70(y), r2=64(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=147(y1), r7=421(x2), r8=159(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=67(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 70
LDI r2, 64
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 147
LDI r7, 421
LDI r8, 159
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 67
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
