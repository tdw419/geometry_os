; DESCRIPTION: Places a blue line segment connecting (151, 215) to (458, 205).
; PLAN: r0=151(x1), r1=215(y1), r2=458(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 215
LDI r2, 458
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
