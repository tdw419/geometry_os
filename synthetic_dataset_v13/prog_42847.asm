; DESCRIPTION: Draws a green line from (481, 137) to (287, 90).
; PLAN: r0=481(x1), r1=137(y1), r2=287(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 137
LDI r2, 287
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
