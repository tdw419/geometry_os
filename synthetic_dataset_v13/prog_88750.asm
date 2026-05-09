; DESCRIPTION: Composite: Places a magenta dot at position (35, 150) then Places a yellow circle of radius 14 at center (80, 94) then Draws a yellow rectangle at (178, 22) with width 34 and height 106.
; PLAN: r0=35(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=94(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=22(y), r12=34(width), r13=106(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 94
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 22
LDI r12, 34
LDI r13, 106
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
