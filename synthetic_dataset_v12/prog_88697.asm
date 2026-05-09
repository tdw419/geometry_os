; DESCRIPTION: Places a yellow line segment connecting (422, 187) to (197, 251).
; PLAN: r0=422(x1), r1=187(y1), r2=197(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 187
LDI r2, 197
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
