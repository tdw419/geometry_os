; DESCRIPTION: Composite: Places a cyan circle of radius 60 at center (448, 185) then Renders a yellow box of size 73x49 starting at (50, 161) then Renders a yellow line between points (431, 61) and (97, 237).
; PLAN: r0=448(x), r1=185(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=161(y), r7=73(width), r8=49(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x1), r11=61(y1), r12=97(x2), r13=237(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 185
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 161
LDI r7, 73
LDI r8, 49
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 61
LDI r12, 97
LDI r13, 237
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
