; DESCRIPTION: Places a white line segment connecting (137, 231) to (104, 193).
; PLAN: r0=137(x1), r1=231(y1), r2=104(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 231
LDI r2, 104
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
