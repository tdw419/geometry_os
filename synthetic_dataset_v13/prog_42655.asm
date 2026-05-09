; DESCRIPTION: Places a green line segment connecting (428, 254) to (223, 225).
; PLAN: r0=428(x1), r1=254(y1), r2=223(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 254
LDI r2, 223
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
