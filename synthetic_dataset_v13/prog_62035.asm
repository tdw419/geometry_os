; DESCRIPTION: Draws a green line from (189, 119) to (363, 66).
; PLAN: r0=189(x1), r1=119(y1), r2=363(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 119
LDI r2, 363
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
