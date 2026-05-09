; DESCRIPTION: Draws a yellow line from (402, 181) to (255, 116).
; PLAN: r0=402(x1), r1=181(y1), r2=255(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 181
LDI r2, 255
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
