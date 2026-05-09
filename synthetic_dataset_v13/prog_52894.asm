; DESCRIPTION: Places a white line segment connecting (84, 129) to (6, 82).
; PLAN: r0=84(x1), r1=129(y1), r2=6(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 129
LDI r2, 6
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
