; DESCRIPTION: Composite: Places a yellow 23x97 rectangle at position (113, 91) then Draws a white line from (507, 172) to (20, 29).
; PLAN: r0=113(x), r1=91(y), r2=23(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=172(y1), r7=20(x2), r8=29(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 91
LDI r2, 23
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 172
LDI r7, 20
LDI r8, 29
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
