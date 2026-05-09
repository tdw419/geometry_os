; DESCRIPTION: Draws a black line from (345, 82) to (231, 232).
; PLAN: r0=345(x1), r1=82(y1), r2=231(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 82
LDI r2, 231
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
