; DESCRIPTION: Composite: Creates a cyan circular shape at (121, 153) with radius 28 then Renders a yellow line between points (86, 151) and (214, 37) then Creates a purple rectangular region at (140, 37) spanning 31 by 67 pixels.
; PLAN: r0=121(x), r1=153(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=151(y1), r7=214(x2), r8=37(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=37(y), r12=31(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 153
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 151
LDI r7, 214
LDI r8, 37
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 37
LDI r12, 31
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
