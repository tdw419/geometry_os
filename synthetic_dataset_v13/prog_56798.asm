; DESCRIPTION: Composite: Sets a single black pixel at (479, 69) then Renders a blue line between points (371, 233) and (164, 157) then Draws a magenta rectangle at (366, 88) with width 37 and height 120.
; PLAN: r0=479(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=371(x1), r6=233(y1), r7=164(x2), r8=157(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=88(y), r12=37(width), r13=120(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 233
LDI r7, 164
LDI r8, 157
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 88
LDI r12, 37
LDI r13, 120
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
