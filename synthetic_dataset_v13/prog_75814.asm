; DESCRIPTION: Composite: Draws a black line from (55, 210) to (71, 131) then Draws a blue rectangle at (10, 122) with width 98 and height 26.
; PLAN: r0=55(x1), r1=210(y1), r2=71(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=122(y), r7=98(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 210
LDI r2, 71
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 122
LDI r7, 98
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
