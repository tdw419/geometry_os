; DESCRIPTION: Composite: Places a black 45x94 rectangle at position (81, 109) then Renders a magenta line between points (412, 34) and (503, 146) then Draws a yellow circle centered at (143, 48) with radius 15.
; PLAN: r0=81(x), r1=109(y), r2=45(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=34(y1), r7=503(x2), r8=146(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=48(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 109
LDI r2, 45
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 34
LDI r7, 503
LDI r8, 146
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 48
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
