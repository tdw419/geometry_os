; DESCRIPTION: Draws a yellow line from (347, 63) to (16, 255).
; PLAN: r0=347(x1), r1=63(y1), r2=16(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 63
LDI r2, 16
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
