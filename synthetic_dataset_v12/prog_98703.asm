; DESCRIPTION: Composite: Draws a purple circle centered at (157, 89) with radius 36 then Renders a yellow box of size 116x71 starting at (192, 55) then Renders a white line between points (184, 37) and (509, 111).
; PLAN: r0=157(x), r1=89(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=55(y), r7=116(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=37(y1), r12=509(x2), r13=111(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 89
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 55
LDI r7, 116
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 37
LDI r12, 509
LDI r13, 111
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
