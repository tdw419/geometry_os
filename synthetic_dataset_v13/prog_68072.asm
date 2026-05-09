; DESCRIPTION: Composite: Places a blue 114x62 rectangle at position (397, 52) then Places a blue line segment connecting (469, 85) to (282, 224).
; PLAN: r0=397(x), r1=52(y), r2=114(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=85(y1), r7=282(x2), r8=224(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 52
LDI r2, 114
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 85
LDI r7, 282
LDI r8, 224
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
