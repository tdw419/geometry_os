; DESCRIPTION: Composite: Renders a cyan disk with center (378, 112) and radius 32 then Draws a purple rectangle at (59, 90) with width 94 and height 115 then Renders a yellow line between points (426, 88) and (25, 232).
; PLAN: r0=378(x), r1=112(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=90(y), r7=94(width), r8=115(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x1), r11=88(y1), r12=25(x2), r13=232(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 112
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 90
LDI r7, 94
LDI r8, 115
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 88
LDI r12, 25
LDI r13, 232
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
