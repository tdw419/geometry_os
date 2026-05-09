; DESCRIPTION: Composite: Renders a blue box of size 116x71 starting at (304, 34) then Draws a magenta line from (238, 216) to (127, 207).
; PLAN: r0=304(x), r1=34(y), r2=116(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=216(y1), r7=127(x2), r8=207(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 34
LDI r2, 116
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 216
LDI r7, 127
LDI r8, 207
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
