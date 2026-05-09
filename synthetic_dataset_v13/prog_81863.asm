; DESCRIPTION: Draws a black line from (444, 73) to (184, 244).
; PLAN: r0=444(x1), r1=73(y1), r2=184(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 73
LDI r2, 184
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
