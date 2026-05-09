; DESCRIPTION: Places a green line segment connecting (2, 77) to (329, 55).
; PLAN: r0=2(x1), r1=77(y1), r2=329(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 77
LDI r2, 329
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
