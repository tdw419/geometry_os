; DESCRIPTION: Places a cyan line segment connecting (388, 61) to (125, 147).
; PLAN: r0=388(x1), r1=61(y1), r2=125(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 61
LDI r2, 125
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
