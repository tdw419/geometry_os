; DESCRIPTION: Draws a black line from (192, 127) to (179, 87).
; PLAN: r0=192(x1), r1=127(y1), r2=179(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 127
LDI r2, 179
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
