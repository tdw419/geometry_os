; DESCRIPTION: Composite: Draws a magenta circle centered at (91, 200) with radius 47 then Places a blue line segment connecting (305, 128) to (287, 115) then Renders a green box of size 102x90 starting at (188, 0).
; PLAN: r0=91(x), r1=200(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=128(y1), r7=287(x2), r8=115(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=0(y), r12=102(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 200
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 128
LDI r7, 287
LDI r8, 115
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 0
LDI r12, 102
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
