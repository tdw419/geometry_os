; DESCRIPTION: Composite: Creates a cyan rectangular region at (52, 111) spanning 106 by 86 pixels then Draws a white circle centered at (454, 92) with radius 10 then Places a blue line segment connecting (389, 119) to (140, 222).
; PLAN: r0=52(x), r1=111(y), r2=106(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=92(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x1), r11=119(y1), r12=140(x2), r13=222(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 111
LDI r2, 106
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 92
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 119
LDI r12, 140
LDI r13, 222
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
