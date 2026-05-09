; DESCRIPTION: Draws a green line from (432, 200) to (374, 115).
; PLAN: r0=432(x1), r1=200(y1), r2=374(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 200
LDI r2, 374
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
