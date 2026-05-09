; DESCRIPTION: Places a white line segment connecting (80, 20) to (487, 23).
; PLAN: r0=80(x1), r1=20(y1), r2=487(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 20
LDI r2, 487
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
