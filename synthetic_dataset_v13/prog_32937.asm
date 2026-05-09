; DESCRIPTION: Draws a cyan line from (287, 148) to (89, 72).
; PLAN: r0=287(x1), r1=148(y1), r2=89(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 148
LDI r2, 89
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
