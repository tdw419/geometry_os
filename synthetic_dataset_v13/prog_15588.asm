; DESCRIPTION: Composite: Renders a black box of size 89x113 starting at (235, 122) then Draws a orange line from (154, 15) to (255, 97).
; PLAN: r0=235(x), r1=122(y), r2=89(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x1), r6=15(y1), r7=255(x2), r8=97(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 122
LDI r2, 89
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 15
LDI r7, 255
LDI r8, 97
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
