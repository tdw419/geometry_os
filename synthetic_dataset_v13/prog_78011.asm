; DESCRIPTION: Composite: Renders a yellow box of size 25x75 starting at (307, 108) then Creates a green circular shape at (58, 107) with radius 57 then Renders a red line between points (155, 235) and (247, 14).
; PLAN: r0=307(x), r1=108(y), r2=25(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=107(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x1), r11=235(y1), r12=247(x2), r13=14(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 108
LDI r2, 25
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 107
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 235
LDI r12, 247
LDI r13, 14
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
