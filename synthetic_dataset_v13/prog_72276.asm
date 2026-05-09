; DESCRIPTION: Places a white line segment connecting (440, 142) to (184, 87).
; PLAN: r0=440(x1), r1=142(y1), r2=184(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 142
LDI r2, 184
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
