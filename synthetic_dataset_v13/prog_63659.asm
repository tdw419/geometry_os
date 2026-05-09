; DESCRIPTION: Places a cyan line segment connecting (273, 197) to (457, 200).
; PLAN: r0=273(x1), r1=197(y1), r2=457(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 197
LDI r2, 457
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
