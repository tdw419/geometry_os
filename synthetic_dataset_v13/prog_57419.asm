; DESCRIPTION: Places a white line segment connecting (489, 103) to (6, 150).
; PLAN: r0=489(x1), r1=103(y1), r2=6(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 103
LDI r2, 6
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
