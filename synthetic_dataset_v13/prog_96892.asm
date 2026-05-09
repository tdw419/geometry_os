; DESCRIPTION: Places a white line segment connecting (345, 50) to (220, 200).
; PLAN: r0=345(x1), r1=50(y1), r2=220(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 50
LDI r2, 220
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
