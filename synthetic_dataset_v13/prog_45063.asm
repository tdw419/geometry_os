; DESCRIPTION: Places a red line segment connecting (453, 202) to (139, 126).
; PLAN: r0=453(x1), r1=202(y1), r2=139(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 202
LDI r2, 139
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
