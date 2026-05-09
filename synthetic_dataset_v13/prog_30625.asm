; DESCRIPTION: Places a white line segment connecting (161, 125) to (222, 45).
; PLAN: r0=161(x1), r1=125(y1), r2=222(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 125
LDI r2, 222
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
