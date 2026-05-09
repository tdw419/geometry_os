; DESCRIPTION: Composite: Draws a blue line from (424, 237) to (197, 179) then Draws a black rectangle at (59, 80) with width 100 and height 17.
; PLAN: r0=424(x1), r1=237(y1), r2=197(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=80(y), r7=100(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 237
LDI r2, 197
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 80
LDI r7, 100
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
