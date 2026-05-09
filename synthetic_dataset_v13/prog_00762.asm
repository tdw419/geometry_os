; DESCRIPTION: Composite: Places a green dot at position (208, 34) then Draws a black line from (323, 49) to (108, 155) then Draws a purple rectangle at (223, 27) with width 99 and height 64.
; PLAN: r0=208(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=49(y1), r7=108(x2), r8=155(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=27(y), r12=99(width), r13=64(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 323
LDI r6, 49
LDI r7, 108
LDI r8, 155
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 27
LDI r12, 99
LDI r13, 64
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
