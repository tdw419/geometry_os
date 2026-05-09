; DESCRIPTION: Places a red line segment connecting (362, 48) to (324, 130).
; PLAN: r0=362(x1), r1=48(y1), r2=324(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 48
LDI r2, 324
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
