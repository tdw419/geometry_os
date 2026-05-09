; DESCRIPTION: Composite: Draws a blue rectangle at (203, 131) with width 60 and height 37 then Places a black line segment connecting (191, 98) to (139, 119).
; PLAN: r0=203(x), r1=131(y), r2=60(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=98(y1), r7=139(x2), r8=119(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 131
LDI r2, 60
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 98
LDI r7, 139
LDI r8, 119
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
