; DESCRIPTION: Composite: Renders a yellow line between points (396, 80) and (296, 255) then Renders a green box of size 10x103 starting at (6, 37) then Sets a single purple pixel at (34, 216).
; PLAN: r0=396(x1), r1=80(y1), r2=296(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=37(y), r7=10(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x), r11=216(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 80
LDI r2, 296
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 37
LDI r7, 10
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 216
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
