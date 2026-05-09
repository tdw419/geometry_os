; DESCRIPTION: Places a green line segment connecting (429, 206) to (205, 250).
; PLAN: r0=429(x1), r1=206(y1), r2=205(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 206
LDI r2, 205
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
