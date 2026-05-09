; DESCRIPTION: Draws a green line from (323, 136) to (356, 91).
; PLAN: r0=323(x1), r1=136(y1), r2=356(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 136
LDI r2, 356
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
