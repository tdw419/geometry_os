; DESCRIPTION: Places a cyan line segment connecting (417, 60) to (441, 191).
; PLAN: r0=417(x1), r1=60(y1), r2=441(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 60
LDI r2, 441
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
