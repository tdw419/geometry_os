; DESCRIPTION: Composite: Draws a orange line from (3, 235) to (456, 139) then Draws a green rectangle at (198, 174) with width 44 and height 19.
; PLAN: r0=3(x1), r1=235(y1), r2=456(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=174(y), r7=44(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 235
LDI r2, 456
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 174
LDI r7, 44
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
