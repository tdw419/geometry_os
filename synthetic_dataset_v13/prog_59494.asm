; DESCRIPTION: Composite: Renders a green line between points (359, 188) and (71, 130) then Renders a magenta box of size 73x106 starting at (48, 114) then Creates a purple circular shape at (284, 51) with radius 51.
; PLAN: r0=359(x1), r1=188(y1), r2=71(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=114(y), r7=73(width), r8=106(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=51(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 188
LDI r2, 71
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 114
LDI r7, 73
LDI r8, 106
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 51
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
