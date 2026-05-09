; DESCRIPTION: Composite: Places a blue line segment connecting (276, 180) to (158, 191) then Creates a orange rectangular region at (349, 65) spanning 82 by 62 pixels.
; PLAN: r0=276(x1), r1=180(y1), r2=158(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=65(y), r7=82(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 180
LDI r2, 158
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 65
LDI r7, 82
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
