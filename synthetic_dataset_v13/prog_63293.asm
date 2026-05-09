; DESCRIPTION: Places a white line segment connecting (317, 220) to (66, 218).
; PLAN: r0=317(x1), r1=220(y1), r2=66(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 220
LDI r2, 66
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
