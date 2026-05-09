; DESCRIPTION: Composite: Places a magenta circle of radius 30 at center (321, 185) then Renders a purple line between points (261, 248) and (263, 44) then Places a white 111x88 rectangle at position (245, 90).
; PLAN: r0=321(x), r1=185(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=248(y1), r7=263(x2), r8=44(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=90(y), r12=111(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 185
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 248
LDI r7, 263
LDI r8, 44
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 90
LDI r12, 111
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
