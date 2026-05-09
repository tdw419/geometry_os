; DESCRIPTION: Places a cyan line segment connecting (260, 190) to (348, 161).
; PLAN: r0=260(x1), r1=190(y1), r2=348(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 190
LDI r2, 348
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
