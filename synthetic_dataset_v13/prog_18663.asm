; DESCRIPTION: Composite: Renders a white box of size 110x60 starting at (276, 140) then Creates a cyan circular shape at (278, 168) with radius 73 then Draws a black line from (385, 216) to (350, 2).
; PLAN: r0=276(x), r1=140(y), r2=110(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=168(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x1), r11=216(y1), r12=350(x2), r13=2(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 140
LDI r2, 110
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 168
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 216
LDI r12, 350
LDI r13, 2
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
