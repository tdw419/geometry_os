; DESCRIPTION: Composite: Places a black line segment connecting (251, 31) to (445, 116) then Draws a blue rectangle at (309, 154) with width 20 and height 35.
; PLAN: r0=251(x1), r1=31(y1), r2=445(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=154(y), r7=20(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 31
LDI r2, 445
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 154
LDI r7, 20
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
