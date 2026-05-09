; DESCRIPTION: Draws a black line from (489, 246) to (414, 128).
; PLAN: r0=489(x1), r1=246(y1), r2=414(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 246
LDI r2, 414
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
