; DESCRIPTION: Places a white line segment connecting (221, 48) to (3, 168).
; PLAN: r0=221(x1), r1=48(y1), r2=3(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 48
LDI r2, 3
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
