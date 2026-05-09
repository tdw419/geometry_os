; DESCRIPTION: Composite: Places a purple 51x28 rectangle at position (1, 138) then Places a yellow line segment connecting (388, 77) to (209, 28) then Draws a red circle centered at (206, 111) with radius 60.
; PLAN: r0=1(x), r1=138(y), r2=51(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=77(y1), r7=209(x2), r8=28(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=111(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 138
LDI r2, 51
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 77
LDI r7, 209
LDI r8, 28
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 111
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
