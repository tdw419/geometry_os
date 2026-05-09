; DESCRIPTION: Renders a green line between points (362, 137) and (489, 115).
; PLAN: r0=362(x1), r1=137(y1), r2=489(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 137
LDI r2, 489
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
