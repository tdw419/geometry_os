; DESCRIPTION: Composite: Draws a orange line from (202, 136) to (153, 65) then Places a magenta 120x118 rectangle at position (30, 39).
; PLAN: r0=202(x1), r1=136(y1), r2=153(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=39(y), r7=120(width), r8=118(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 136
LDI r2, 153
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 39
LDI r7, 120
LDI r8, 118
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
