; DESCRIPTION: Places a green line segment connecting (321, 102) to (195, 164).
; PLAN: r0=321(x1), r1=102(y1), r2=195(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 102
LDI r2, 195
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
