; DESCRIPTION: Places a white line segment connecting (174, 79) to (399, 87).
; PLAN: r0=174(x1), r1=79(y1), r2=399(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 79
LDI r2, 399
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
