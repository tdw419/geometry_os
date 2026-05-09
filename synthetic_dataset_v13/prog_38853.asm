; DESCRIPTION: Composite: Places a red line segment connecting (181, 84) to (422, 226) then Draws a yellow rectangle at (1, 146) with width 107 and height 40.
; PLAN: r0=181(x1), r1=84(y1), r2=422(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=146(y), r7=107(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 84
LDI r2, 422
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 146
LDI r7, 107
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
