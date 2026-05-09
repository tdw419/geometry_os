; DESCRIPTION: Composite: Renders a yellow box of size 84x80 starting at (401, 81) then Renders a red line between points (191, 223) and (371, 25) then Creates a black circular shape at (129, 87) with radius 57.
; PLAN: r0=401(x), r1=81(y), r2=84(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=223(y1), r7=371(x2), r8=25(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=87(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 81
LDI r2, 84
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 223
LDI r7, 371
LDI r8, 25
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 87
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
