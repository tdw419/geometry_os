; DESCRIPTION: Places a cyan line segment connecting (22, 112) to (186, 79).
; PLAN: r0=22(x1), r1=112(y1), r2=186(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 112
LDI r2, 186
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
