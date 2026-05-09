; DESCRIPTION: Composite: Creates a red rectangular region at (190, 97) spanning 74 by 82 pixels then Places a black line segment connecting (452, 73) to (117, 120).
; PLAN: r0=190(x), r1=97(y), r2=74(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x1), r6=73(y1), r7=117(x2), r8=120(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 97
LDI r2, 74
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 73
LDI r7, 117
LDI r8, 120
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
