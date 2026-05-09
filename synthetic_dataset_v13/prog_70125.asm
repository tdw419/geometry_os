; DESCRIPTION: Composite: Creates a orange rectangular region at (126, 191) spanning 53 by 29 pixels then Draws a purple line from (446, 111) to (457, 131).
; PLAN: r0=126(x), r1=191(y), r2=53(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=111(y1), r7=457(x2), r8=131(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 191
LDI r2, 53
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 111
LDI r7, 457
LDI r8, 131
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
