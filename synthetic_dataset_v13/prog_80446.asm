; DESCRIPTION: Composite: Renders a red line between points (259, 126) and (64, 115) then Creates a green rectangular region at (90, 201) spanning 21 by 50 pixels.
; PLAN: r0=259(x1), r1=126(y1), r2=64(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=201(y), r7=21(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 126
LDI r2, 64
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 201
LDI r7, 21
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
