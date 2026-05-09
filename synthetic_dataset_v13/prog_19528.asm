; DESCRIPTION: Composite: Draws a orange line from (233, 50) to (159, 29) then Draws a white rectangle at (215, 207) with width 67 and height 19.
; PLAN: r0=233(x1), r1=50(y1), r2=159(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=207(y), r7=67(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 50
LDI r2, 159
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 207
LDI r7, 67
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
