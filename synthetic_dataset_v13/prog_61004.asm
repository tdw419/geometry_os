; DESCRIPTION: Composite: Places a red circle of radius 24 at center (88, 113) then Draws a purple line from (455, 188) to (401, 161) then Creates a yellow rectangular region at (69, 73) spanning 77 by 32 pixels.
; PLAN: r0=88(x), r1=113(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=188(y1), r7=401(x2), r8=161(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=73(y), r12=77(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 113
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 188
LDI r7, 401
LDI r8, 161
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 73
LDI r12, 77
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
