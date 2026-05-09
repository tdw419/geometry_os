; DESCRIPTION: Composite: Renders a orange line between points (486, 214) and (134, 44) then Renders a purple box of size 19x42 starting at (489, 49).
; PLAN: r0=486(x1), r1=214(y1), r2=134(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=49(y), r7=19(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 214
LDI r2, 134
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 49
LDI r7, 19
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
