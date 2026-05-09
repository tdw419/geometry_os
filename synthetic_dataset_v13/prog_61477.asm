; DESCRIPTION: Draws a yellow line from (178, 244) to (103, 147).
; PLAN: r0=178(x1), r1=244(y1), r2=103(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 244
LDI r2, 103
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
