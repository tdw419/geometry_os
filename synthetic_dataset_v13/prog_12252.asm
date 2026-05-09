; DESCRIPTION: Composite: Places a blue circle of radius 55 at center (355, 120) then Draws a white line from (451, 16) to (55, 89) then Creates a red rectangular region at (358, 157) spanning 20 by 64 pixels.
; PLAN: r0=355(x), r1=120(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=16(y1), r7=55(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=157(y), r12=20(width), r13=64(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 120
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 16
LDI r7, 55
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 157
LDI r12, 20
LDI r13, 64
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
