; DESCRIPTION: Places a green line segment connecting (422, 187) to (305, 44).
; PLAN: r0=422(x1), r1=187(y1), r2=305(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 187
LDI r2, 305
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
