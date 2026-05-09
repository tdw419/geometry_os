; DESCRIPTION: Places a white line segment connecting (317, 86) to (150, 129).
; PLAN: r0=317(x1), r1=86(y1), r2=150(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 86
LDI r2, 150
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
