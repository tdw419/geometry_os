; DESCRIPTION: Places a blue line segment connecting (418, 141) to (275, 183).
; PLAN: r0=418(x1), r1=141(y1), r2=275(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 141
LDI r2, 275
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
