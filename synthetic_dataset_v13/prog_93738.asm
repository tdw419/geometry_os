; DESCRIPTION: Composite: Creates a red rectangular region at (173, 85) spanning 62 by 21 pixels then Places a green line segment connecting (9, 159) to (183, 82).
; PLAN: r0=173(x), r1=85(y), r2=62(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=159(y1), r7=183(x2), r8=82(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 85
LDI r2, 62
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 159
LDI r7, 183
LDI r8, 82
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
