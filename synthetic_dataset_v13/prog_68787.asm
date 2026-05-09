; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (384, 94) then Renders a blue line between points (431, 231) and (364, 229) then Renders a black box of size 63x103 starting at (164, 99).
; PLAN: r0=384(x), r1=94(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=231(y1), r7=364(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=99(y), r12=63(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 94
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 231
LDI r7, 364
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 99
LDI r12, 63
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
