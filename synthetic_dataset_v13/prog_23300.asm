; DESCRIPTION: Composite: Renders a red box of size 75x71 starting at (351, 169) then Places a magenta dot at position (351, 105) then Places a yellow line segment connecting (255, 83) to (435, 178).
; PLAN: r0=351(x), r1=169(y), r2=75(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=105(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=255(x1), r11=83(y1), r12=435(x2), r13=178(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 169
LDI r2, 75
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 105
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 255
LDI r11, 83
LDI r12, 435
LDI r13, 178
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
