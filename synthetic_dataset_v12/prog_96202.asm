; DESCRIPTION: Draws a yellow line from (255, 63) to (285, 116).
; PLAN: r0=255(x1), r1=63(y1), r2=285(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 63
LDI r2, 285
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
