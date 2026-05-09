; DESCRIPTION: Draws a purple line from (62, 228) to (347, 128).
; PLAN: r0=62(x1), r1=228(y1), r2=347(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 228
LDI r2, 347
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
