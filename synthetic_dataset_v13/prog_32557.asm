; DESCRIPTION: Composite: Creates a orange rectangular region at (409, 119) spanning 53 by 114 pixels then Places a white line segment connecting (233, 37) to (432, 190).
; PLAN: r0=409(x), r1=119(y), r2=53(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=37(y1), r7=432(x2), r8=190(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 119
LDI r2, 53
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 37
LDI r7, 432
LDI r8, 190
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
