; DESCRIPTION: Composite: Places a blue line segment connecting (329, 222) to (427, 54) then Creates a white rectangular region at (211, 56) spanning 113 by 90 pixels.
; PLAN: r0=329(x1), r1=222(y1), r2=427(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=56(y), r7=113(width), r8=90(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 222
LDI r2, 427
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 56
LDI r7, 113
LDI r8, 90
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
