; DESCRIPTION: Composite: Draws a yellow line from (105, 135) to (98, 124) then Renders a orange box of size 102x98 starting at (107, 67) then Creates a white circular shape at (292, 139) with radius 73.
; PLAN: r0=105(x1), r1=135(y1), r2=98(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=67(y), r7=102(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x), r11=139(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 135
LDI r2, 98
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 67
LDI r7, 102
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 139
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
