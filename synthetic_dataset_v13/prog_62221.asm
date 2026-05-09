; DESCRIPTION: Places a white line segment connecting (196, 46) to (150, 218).
; PLAN: r0=196(x1), r1=46(y1), r2=150(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 46
LDI r2, 150
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
