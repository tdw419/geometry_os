; DESCRIPTION: Composite: Places a blue circle of radius 64 at center (404, 128) then Renders a purple box of size 12x109 starting at (424, 36) then Renders a magenta line between points (289, 105) and (312, 242).
; PLAN: r0=404(x), r1=128(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=36(y), r7=12(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=289(x1), r11=105(y1), r12=312(x2), r13=242(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 128
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 36
LDI r7, 12
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 105
LDI r12, 312
LDI r13, 242
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
