; DESCRIPTION: Composite: Creates a yellow rectangular region at (287, 224) spanning 36 by 16 pixels then Renders a purple line between points (272, 236) and (14, 19).
; PLAN: r0=287(x), r1=224(y), r2=36(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x1), r6=236(y1), r7=14(x2), r8=19(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 224
LDI r2, 36
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 236
LDI r7, 14
LDI r8, 19
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
