; DESCRIPTION: Places a white line segment connecting (193, 67) to (464, 54).
; PLAN: r0=193(x1), r1=67(y1), r2=464(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 67
LDI r2, 464
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
