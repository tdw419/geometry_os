; DESCRIPTION: Composite: Places a blue line segment connecting (65, 25) to (77, 32) then Draws a white rectangle at (123, 108) with width 56 and height 49.
; PLAN: r0=65(x1), r1=25(y1), r2=77(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=108(y), r7=56(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 25
LDI r2, 77
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 108
LDI r7, 56
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
