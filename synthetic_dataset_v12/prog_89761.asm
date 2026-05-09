; DESCRIPTION: Composite: Renders a magenta box of size 103x15 starting at (246, 35) then Draws a blue line from (473, 32) to (427, 136).
; PLAN: r0=246(x), r1=35(y), r2=103(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x1), r6=32(y1), r7=427(x2), r8=136(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 35
LDI r2, 103
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 32
LDI r7, 427
LDI r8, 136
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
