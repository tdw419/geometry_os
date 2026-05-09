; DESCRIPTION: Draws a green line from (47, 252) to (251, 91).
; PLAN: r0=47(x1), r1=252(y1), r2=251(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 252
LDI r2, 251
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
