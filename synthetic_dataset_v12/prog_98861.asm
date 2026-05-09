; DESCRIPTION: Places a blue line segment connecting (365, 186) to (363, 11).
; PLAN: r0=365(x1), r1=186(y1), r2=363(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 186
LDI r2, 363
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
