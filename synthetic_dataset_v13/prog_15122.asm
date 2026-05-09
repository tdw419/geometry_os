; DESCRIPTION: Places a white line segment connecting (350, 161) to (124, 159).
; PLAN: r0=350(x1), r1=161(y1), r2=124(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 161
LDI r2, 124
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
