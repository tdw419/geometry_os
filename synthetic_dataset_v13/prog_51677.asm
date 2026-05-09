; DESCRIPTION: Composite: Draws a white rectangle at (467, 59) with width 38 and height 73 then Places a orange line segment connecting (204, 245) to (352, 53).
; PLAN: r0=467(x), r1=59(y), r2=38(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x1), r6=245(y1), r7=352(x2), r8=53(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 59
LDI r2, 38
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 245
LDI r7, 352
LDI r8, 53
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
