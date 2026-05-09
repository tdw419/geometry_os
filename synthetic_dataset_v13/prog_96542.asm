; DESCRIPTION: Composite: Creates a black rectangular region at (315, 87) spanning 94 by 105 pixels then Places a green line segment connecting (389, 102) to (274, 236).
; PLAN: r0=315(x), r1=87(y), r2=94(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x1), r6=102(y1), r7=274(x2), r8=236(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 87
LDI r2, 94
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 102
LDI r7, 274
LDI r8, 236
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
