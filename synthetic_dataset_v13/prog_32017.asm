; DESCRIPTION: Places a cyan line segment connecting (429, 66) to (478, 192).
; PLAN: r0=429(x1), r1=66(y1), r2=478(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 66
LDI r2, 478
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
