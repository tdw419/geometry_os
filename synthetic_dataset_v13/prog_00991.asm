; DESCRIPTION: Places a cyan line segment connecting (229, 232) to (225, 137).
; PLAN: r0=229(x1), r1=232(y1), r2=225(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 232
LDI r2, 225
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
