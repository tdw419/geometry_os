; DESCRIPTION: Composite: Renders a purple box of size 23x21 starting at (383, 206) then Creates a yellow circular shape at (204, 131) with radius 79 then Places a magenta line segment connecting (231, 235) to (413, 160).
; PLAN: r0=383(x), r1=206(y), r2=23(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=131(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x1), r11=235(y1), r12=413(x2), r13=160(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 206
LDI r2, 23
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 131
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 235
LDI r12, 413
LDI r13, 160
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
