; DESCRIPTION: Composite: Creates a cyan rectangular region at (422, 61) spanning 85 by 40 pixels then Places a green line segment connecting (463, 156) to (80, 194).
; PLAN: r0=422(x), r1=61(y), r2=85(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=156(y1), r7=80(x2), r8=194(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 61
LDI r2, 85
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 156
LDI r7, 80
LDI r8, 194
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
