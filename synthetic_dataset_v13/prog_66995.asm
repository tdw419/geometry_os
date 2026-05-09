; DESCRIPTION: Places a red line segment connecting (413, 230) to (511, 176).
; PLAN: r0=413(x1), r1=230(y1), r2=511(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 230
LDI r2, 511
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
