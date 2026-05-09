; DESCRIPTION: Places a green line segment connecting (352, 12) to (458, 131).
; PLAN: r0=352(x1), r1=12(y1), r2=458(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 12
LDI r2, 458
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
