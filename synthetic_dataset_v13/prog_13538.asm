; DESCRIPTION: Composite: Draws a black circle centered at (456, 45) with radius 37 then Creates a blue rectangular region at (14, 92) spanning 42 by 11 pixels then Draws a cyan line from (414, 200) to (92, 158).
; PLAN: r0=456(x), r1=45(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=92(y), r7=42(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x1), r11=200(y1), r12=92(x2), r13=158(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 45
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 92
LDI r7, 42
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 200
LDI r12, 92
LDI r13, 158
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
