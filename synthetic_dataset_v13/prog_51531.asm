; DESCRIPTION: Places a green line segment connecting (409, 180) to (120, 249).
; PLAN: r0=409(x1), r1=180(y1), r2=120(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 180
LDI r2, 120
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
