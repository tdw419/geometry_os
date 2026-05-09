; DESCRIPTION: Draws a black line from (126, 25) to (457, 133).
; PLAN: r0=126(x1), r1=25(y1), r2=457(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 25
LDI r2, 457
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
