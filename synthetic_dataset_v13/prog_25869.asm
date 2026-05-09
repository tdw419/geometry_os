; DESCRIPTION: Composite: Places a yellow line segment connecting (199, 133) to (442, 15) then Creates a red rectangular region at (195, 49) spanning 120 by 84 pixels.
; PLAN: r0=199(x1), r1=133(y1), r2=442(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=49(y), r7=120(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 133
LDI r2, 442
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 49
LDI r7, 120
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
