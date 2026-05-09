; DESCRIPTION: Draws a black line from (184, 132) to (510, 156).
; PLAN: r0=184(x1), r1=132(y1), r2=510(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 132
LDI r2, 510
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
