; DESCRIPTION: Places a cyan line segment connecting (484, 61) to (377, 119).
; PLAN: r0=484(x1), r1=61(y1), r2=377(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 61
LDI r2, 377
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
