; DESCRIPTION: Composite: Places a yellow line segment connecting (13, 157) to (16, 111) then Draws a magenta circle centered at (303, 126) with radius 77 then Draws a blue rectangle at (254, 27) with width 92 and height 95.
; PLAN: r0=13(x1), r1=157(y1), r2=16(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=126(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=27(y), r12=92(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 157
LDI r2, 16
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 126
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 27
LDI r12, 92
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
