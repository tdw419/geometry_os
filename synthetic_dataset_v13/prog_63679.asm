; DESCRIPTION: Places a red line segment connecting (256, 174) to (429, 79).
; PLAN: r0=256(x1), r1=174(y1), r2=429(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 174
LDI r2, 429
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
