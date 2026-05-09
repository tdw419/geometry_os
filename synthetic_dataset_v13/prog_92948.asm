; DESCRIPTION: Places a green line segment connecting (409, 19) to (303, 64).
; PLAN: r0=409(x1), r1=19(y1), r2=303(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 19
LDI r2, 303
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
