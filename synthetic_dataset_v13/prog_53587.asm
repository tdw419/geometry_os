; DESCRIPTION: Places a white line segment connecting (508, 154) to (193, 87).
; PLAN: r0=508(x1), r1=154(y1), r2=193(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 154
LDI r2, 193
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
