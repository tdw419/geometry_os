; DESCRIPTION: Draws a cyan line from (478, 8) to (287, 89).
; PLAN: r0=478(x1), r1=8(y1), r2=287(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 8
LDI r2, 287
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
