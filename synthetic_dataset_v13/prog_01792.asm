; DESCRIPTION: Composite: Creates a green circular shape at (82, 163) with radius 72 then Draws a red line from (415, 156) to (85, 191).
; PLAN: r0=82(x), r1=163(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=156(y1), r7=85(x2), r8=191(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 163
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 156
LDI r7, 85
LDI r8, 191
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
