; DESCRIPTION: Places a green line segment connecting (106, 186) to (164, 99).
; PLAN: r0=106(x1), r1=186(y1), r2=164(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 186
LDI r2, 164
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
