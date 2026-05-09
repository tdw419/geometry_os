; DESCRIPTION: Composite: Creates a cyan rectangular region at (330, 109) spanning 86 by 23 pixels then Creates a magenta circular shape at (261, 74) with radius 59 then Renders a cyan line between points (310, 235) and (356, 49).
; PLAN: r0=330(x), r1=109(y), r2=86(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=74(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x1), r11=235(y1), r12=356(x2), r13=49(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 109
LDI r2, 86
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 74
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 235
LDI r12, 356
LDI r13, 49
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
