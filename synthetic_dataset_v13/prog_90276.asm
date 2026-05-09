; DESCRIPTION: Composite: Creates a yellow rectangular region at (152, 149) spanning 83 by 21 pixels then Places a black circle of radius 76 at center (256, 141) then Renders a blue line between points (362, 166) and (205, 151).
; PLAN: r0=152(x), r1=149(y), r2=83(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=141(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=362(x1), r11=166(y1), r12=205(x2), r13=151(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 149
LDI r2, 83
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 141
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 362
LDI r11, 166
LDI r12, 205
LDI r13, 151
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
