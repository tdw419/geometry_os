; DESCRIPTION: Draws a yellow line from (140, 98) to (87, 218).
; PLAN: r0=140(x1), r1=98(y1), r2=87(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 98
LDI r2, 87
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
