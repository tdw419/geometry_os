; DESCRIPTION: Composite: Draws a yellow line from (176, 133) to (402, 145) then Draws a cyan circle centered at (142, 181) with radius 46.
; PLAN: r0=176(x1), r1=133(y1), r2=402(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=181(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 133
LDI r2, 402
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 181
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
