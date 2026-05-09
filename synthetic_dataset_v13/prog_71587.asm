; DESCRIPTION: Composite: Places a orange line segment connecting (198, 247) to (0, 28) then Draws a white rectangle at (350, 136) with width 76 and height 29.
; PLAN: r0=198(x1), r1=247(y1), r2=0(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=136(y), r7=76(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 247
LDI r2, 0
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 136
LDI r7, 76
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
