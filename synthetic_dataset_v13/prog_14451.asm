; DESCRIPTION: Places a cyan line segment connecting (406, 201) to (408, 155).
; PLAN: r0=406(x1), r1=201(y1), r2=408(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 201
LDI r2, 408
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
