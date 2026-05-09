; DESCRIPTION: Composite: Creates a purple rectangular region at (463, 130) spanning 32 by 67 pixels then Draws a cyan circle centered at (21, 232) with radius 12 then Draws a purple line from (268, 232) to (98, 168).
; PLAN: r0=463(x), r1=130(y), r2=32(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=232(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x1), r11=232(y1), r12=98(x2), r13=168(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 130
LDI r2, 32
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 232
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 232
LDI r12, 98
LDI r13, 168
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
