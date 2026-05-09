; DESCRIPTION: Places a cyan line segment connecting (201, 63) to (335, 182).
; PLAN: r0=201(x1), r1=63(y1), r2=335(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 63
LDI r2, 335
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
