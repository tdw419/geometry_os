; DESCRIPTION: Draws a green line from (437, 71) to (2, 119).
; PLAN: r0=437(x1), r1=71(y1), r2=2(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 71
LDI r2, 2
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
