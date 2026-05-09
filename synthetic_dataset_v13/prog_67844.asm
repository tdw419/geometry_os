; DESCRIPTION: Draws a black line from (345, 226) to (506, 82).
; PLAN: r0=345(x1), r1=226(y1), r2=506(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 226
LDI r2, 506
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
