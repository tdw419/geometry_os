; DESCRIPTION: Places a green line segment connecting (409, 210) to (165, 87).
; PLAN: r0=409(x1), r1=210(y1), r2=165(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 210
LDI r2, 165
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
