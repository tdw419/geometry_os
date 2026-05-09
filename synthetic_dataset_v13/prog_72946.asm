; DESCRIPTION: Composite: Draws a black rectangle at (72, 69) with width 22 and height 108 then Draws a yellow line from (251, 53) to (119, 189).
; PLAN: r0=72(x), r1=69(y), r2=22(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=53(y1), r7=119(x2), r8=189(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 69
LDI r2, 22
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 53
LDI r7, 119
LDI r8, 189
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
