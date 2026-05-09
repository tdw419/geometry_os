; DESCRIPTION: Composite: Places a green line segment connecting (414, 234) to (183, 105) then Creates a black rectangular region at (278, 145) spanning 82 by 76 pixels.
; PLAN: r0=414(x1), r1=234(y1), r2=183(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=145(y), r7=82(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 234
LDI r2, 183
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 145
LDI r7, 82
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
