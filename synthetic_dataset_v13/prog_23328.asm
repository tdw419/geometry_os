; DESCRIPTION: Composite: Creates a purple rectangular region at (362, 148) spanning 32 by 33 pixels then Places a green circle of radius 55 at center (247, 76) then Places a black line segment connecting (337, 42) to (505, 69).
; PLAN: r0=362(x), r1=148(y), r2=32(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=76(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=42(y1), r12=505(x2), r13=69(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 148
LDI r2, 32
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 76
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 42
LDI r12, 505
LDI r13, 69
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
