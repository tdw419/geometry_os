; DESCRIPTION: Places a cyan line segment connecting (174, 217) to (429, 110).
; PLAN: r0=174(x1), r1=217(y1), r2=429(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 217
LDI r2, 429
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
