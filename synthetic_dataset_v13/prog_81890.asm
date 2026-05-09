; DESCRIPTION: Draws a white line from (131, 52) to (97, 138).
; PLAN: r0=131(x1), r1=52(y1), r2=97(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 52
LDI r2, 97
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
