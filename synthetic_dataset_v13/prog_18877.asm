; DESCRIPTION: Composite: Places a magenta line segment connecting (310, 95) to (31, 45) then Draws a magenta rectangle at (32, 5) with width 75 and height 113 then Draws a black circle centered at (463, 205) with radius 28.
; PLAN: r0=310(x1), r1=95(y1), r2=31(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=5(y), r7=75(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=205(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 95
LDI r2, 31
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 5
LDI r7, 75
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 205
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
