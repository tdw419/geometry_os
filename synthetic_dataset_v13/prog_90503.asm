; DESCRIPTION: Composite: Places a red line segment connecting (435, 83) to (494, 122) then Draws a black rectangle at (117, 84) with width 70 and height 99.
; PLAN: r0=435(x1), r1=83(y1), r2=494(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=84(y), r7=70(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 83
LDI r2, 494
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 84
LDI r7, 70
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
