; DESCRIPTION: Draws a black line from (231, 10) to (15, 52).
; PLAN: r0=231(x1), r1=10(y1), r2=15(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 10
LDI r2, 15
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
