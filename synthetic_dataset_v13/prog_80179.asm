; DESCRIPTION: Places a cyan line segment connecting (139, 55) to (200, 91).
; PLAN: r0=139(x1), r1=55(y1), r2=200(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 55
LDI r2, 200
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
