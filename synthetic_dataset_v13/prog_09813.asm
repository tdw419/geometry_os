; DESCRIPTION: Places a green line segment connecting (106, 10) to (335, 128).
; PLAN: r0=106(x1), r1=10(y1), r2=335(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 10
LDI r2, 335
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
