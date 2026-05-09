; DESCRIPTION: Places a blue line segment connecting (193, 157) to (405, 179).
; PLAN: r0=193(x1), r1=157(y1), r2=405(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 157
LDI r2, 405
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
