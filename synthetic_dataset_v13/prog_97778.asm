; DESCRIPTION: Places a cyan line segment connecting (508, 200) to (91, 159).
; PLAN: r0=508(x1), r1=200(y1), r2=91(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 200
LDI r2, 91
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
