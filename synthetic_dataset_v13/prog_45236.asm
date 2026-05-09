; DESCRIPTION: Composite: Draws a magenta line from (1, 238) to (201, 98) then Places a blue circle of radius 54 at center (336, 60) then Creates a yellow rectangular region at (367, 44) spanning 68 by 29 pixels.
; PLAN: r0=1(x1), r1=238(y1), r2=201(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=60(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=44(y), r12=68(width), r13=29(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 238
LDI r2, 201
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 60
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 44
LDI r12, 68
LDI r13, 29
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
