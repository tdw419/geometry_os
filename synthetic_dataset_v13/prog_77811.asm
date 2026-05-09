; DESCRIPTION: Composite: Places a blue line segment connecting (23, 5) to (120, 254) then Draws a black rectangle at (303, 125) with width 107 and height 79.
; PLAN: r0=23(x1), r1=5(y1), r2=120(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=125(y), r7=107(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 5
LDI r2, 120
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 125
LDI r7, 107
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
