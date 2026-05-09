; DESCRIPTION: Places a cyan line segment connecting (309, 106) to (163, 124).
; PLAN: r0=309(x1), r1=106(y1), r2=163(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 106
LDI r2, 163
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
