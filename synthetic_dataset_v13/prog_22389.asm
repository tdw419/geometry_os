; DESCRIPTION: Places a cyan line segment connecting (413, 95) to (466, 106).
; PLAN: r0=413(x1), r1=95(y1), r2=466(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 95
LDI r2, 466
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
