; DESCRIPTION: Composite: Creates a orange rectangular region at (279, 75) spanning 90 by 90 pixels then Places a orange line segment connecting (408, 5) to (296, 39).
; PLAN: r0=279(x), r1=75(y), r2=90(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x1), r6=5(y1), r7=296(x2), r8=39(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 75
LDI r2, 90
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 5
LDI r7, 296
LDI r8, 39
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
