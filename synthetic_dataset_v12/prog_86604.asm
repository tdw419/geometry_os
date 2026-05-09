; DESCRIPTION: Composite: Places a orange 33x23 rectangle at position (434, 23) then Creates a green circular shape at (97, 171) with radius 13 then Renders a magenta line between points (135, 235) and (26, 160).
; PLAN: r0=434(x), r1=23(y), r2=33(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=171(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x1), r11=235(y1), r12=26(x2), r13=160(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 23
LDI r2, 33
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 171
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 235
LDI r12, 26
LDI r13, 160
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
