; DESCRIPTION: Composite: Draws a orange rectangle at (67, 139) with width 71 and height 31 then Renders a white line between points (136, 25) and (423, 42).
; PLAN: r0=67(x), r1=139(y), r2=71(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x1), r6=25(y1), r7=423(x2), r8=42(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 139
LDI r2, 71
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 25
LDI r7, 423
LDI r8, 42
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
