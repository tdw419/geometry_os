; DESCRIPTION: Renders a black line between points (287, 212) and (405, 10).
; PLAN: r0=287(x1), r1=212(y1), r2=405(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 212
LDI r2, 405
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
