; DESCRIPTION: Places a cyan line segment connecting (119, 89) to (504, 133).
; PLAN: r0=119(x1), r1=89(y1), r2=504(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 89
LDI r2, 504
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
