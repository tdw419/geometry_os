; DESCRIPTION: Composite: Creates a green rectangular region at (345, 86) spanning 44 by 99 pixels then Places a purple circle of radius 34 at center (149, 103) then Renders a white line between points (6, 179) and (263, 214).
; PLAN: r0=345(x), r1=86(y), r2=44(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=103(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x1), r11=179(y1), r12=263(x2), r13=214(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 86
LDI r2, 44
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 103
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 179
LDI r12, 263
LDI r13, 214
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
