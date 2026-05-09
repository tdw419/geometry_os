; DESCRIPTION: Places a cyan line segment connecting (225, 82) to (89, 216).
; PLAN: r0=225(x1), r1=82(y1), r2=89(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 82
LDI r2, 89
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
