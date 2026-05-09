; DESCRIPTION: Draws a black line from (263, 105) to (304, 163).
; PLAN: r0=263(x1), r1=105(y1), r2=304(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 105
LDI r2, 304
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
