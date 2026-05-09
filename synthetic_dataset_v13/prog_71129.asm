; DESCRIPTION: Places a green line segment connecting (409, 150) to (104, 143).
; PLAN: r0=409(x1), r1=150(y1), r2=104(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 150
LDI r2, 104
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
