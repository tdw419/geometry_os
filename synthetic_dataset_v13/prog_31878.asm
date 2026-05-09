; DESCRIPTION: Composite: Sets a single yellow pixel at (501, 67) then Draws a purple rectangle at (246, 22) with width 26 and height 104.
; PLAN: r0=501(x), r1=67(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=22(y), r7=26(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 67
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 246
LDI r6, 22
LDI r7, 26
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
