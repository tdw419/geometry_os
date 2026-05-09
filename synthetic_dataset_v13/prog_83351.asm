; DESCRIPTION: Places a red line segment connecting (252, 177) to (145, 37).
; PLAN: r0=252(x1), r1=177(y1), r2=145(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 177
LDI r2, 145
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
