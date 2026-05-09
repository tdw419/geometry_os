; DESCRIPTION: Composite: Creates a black rectangular region at (182, 53) spanning 49 by 48 pixels then Draws a white line from (327, 180) to (501, 158).
; PLAN: r0=182(x), r1=53(y), r2=49(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x1), r6=180(y1), r7=501(x2), r8=158(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 53
LDI r2, 49
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 180
LDI r7, 501
LDI r8, 158
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
