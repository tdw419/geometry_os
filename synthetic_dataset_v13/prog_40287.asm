; DESCRIPTION: Composite: Renders a white line between points (361, 126) and (305, 30) then Creates a green rectangular region at (414, 60) spanning 89 by 83 pixels.
; PLAN: r0=361(x1), r1=126(y1), r2=305(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=60(y), r7=89(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 126
LDI r2, 305
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 60
LDI r7, 89
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
