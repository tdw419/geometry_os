; DESCRIPTION: Places a green line segment connecting (342, 218) to (433, 166).
; PLAN: r0=342(x1), r1=218(y1), r2=433(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 218
LDI r2, 433
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
