; DESCRIPTION: Draws a black line from (192, 87) to (99, 182).
; PLAN: r0=192(x1), r1=87(y1), r2=99(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 87
LDI r2, 99
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
