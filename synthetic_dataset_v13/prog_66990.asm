; DESCRIPTION: Places a white line segment connecting (392, 61) to (54, 1).
; PLAN: r0=392(x1), r1=61(y1), r2=54(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 61
LDI r2, 54
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
