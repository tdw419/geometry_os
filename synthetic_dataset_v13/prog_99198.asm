; DESCRIPTION: Draws a black line from (413, 22) to (31, 95).
; PLAN: r0=413(x1), r1=22(y1), r2=31(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 22
LDI r2, 31
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
