; DESCRIPTION: Places a cyan line segment connecting (200, 147) to (11, 84).
; PLAN: r0=200(x1), r1=147(y1), r2=11(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 147
LDI r2, 11
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
