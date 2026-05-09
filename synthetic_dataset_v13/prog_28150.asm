; DESCRIPTION: Composite: Draws a black rectangle at (156, 103) with width 114 and height 101 then Draws a blue line from (130, 203) to (305, 87).
; PLAN: r0=156(x), r1=103(y), r2=114(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=203(y1), r7=305(x2), r8=87(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 103
LDI r2, 114
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 203
LDI r7, 305
LDI r8, 87
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
