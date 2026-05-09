; DESCRIPTION: Composite: Draws a magenta line from (82, 102) to (352, 136) then Draws a blue rectangle at (386, 227) with width 91 and height 13.
; PLAN: r0=82(x1), r1=102(y1), r2=352(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=227(y), r7=91(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 102
LDI r2, 352
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 227
LDI r7, 91
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
