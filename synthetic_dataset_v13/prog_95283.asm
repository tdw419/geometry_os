; DESCRIPTION: Composite: Draws a yellow line from (412, 79) to (170, 77) then Renders a green box of size 118x12 starting at (339, 100).
; PLAN: r0=412(x1), r1=79(y1), r2=170(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=100(y), r7=118(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 79
LDI r2, 170
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 100
LDI r7, 118
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
