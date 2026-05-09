; DESCRIPTION: Places a white line segment connecting (220, 94) to (113, 80).
; PLAN: r0=220(x1), r1=94(y1), r2=113(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 94
LDI r2, 113
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
