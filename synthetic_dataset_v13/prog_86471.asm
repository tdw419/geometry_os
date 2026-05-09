; DESCRIPTION: Places a green line segment connecting (329, 12) to (225, 18).
; PLAN: r0=329(x1), r1=12(y1), r2=225(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 12
LDI r2, 225
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
