; DESCRIPTION: Draws a white line from (231, 101) to (388, 99).
; PLAN: r0=231(x1), r1=101(y1), r2=388(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 101
LDI r2, 388
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
