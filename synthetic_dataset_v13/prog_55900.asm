; DESCRIPTION: Places a cyan line segment connecting (172, 17) to (91, 200).
; PLAN: r0=172(x1), r1=17(y1), r2=91(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 17
LDI r2, 91
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
