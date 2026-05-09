; DESCRIPTION: Places a cyan line segment connecting (110, 23) to (169, 82).
; PLAN: r0=110(x1), r1=23(y1), r2=169(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 23
LDI r2, 169
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
