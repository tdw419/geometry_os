; DESCRIPTION: Renders a yellow line between points (400, 164) and (452, 87).
; PLAN: r0=400(x1), r1=164(y1), r2=452(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 164
LDI r2, 452
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
