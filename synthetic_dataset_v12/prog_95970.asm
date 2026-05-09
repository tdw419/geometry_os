; DESCRIPTION: Places a cyan line segment connecting (195, 211) to (153, 216).
; PLAN: r0=195(x1), r1=211(y1), r2=153(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 211
LDI r2, 153
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
