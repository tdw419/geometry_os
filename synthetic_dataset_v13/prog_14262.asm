; DESCRIPTION: Places a white line segment connecting (109, 33) to (429, 127).
; PLAN: r0=109(x1), r1=33(y1), r2=429(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 33
LDI r2, 429
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
