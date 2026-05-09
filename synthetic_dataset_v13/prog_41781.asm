; DESCRIPTION: Places a cyan line segment connecting (106, 89) to (453, 181).
; PLAN: r0=106(x1), r1=89(y1), r2=453(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 89
LDI r2, 453
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
