; DESCRIPTION: Places a cyan line segment connecting (237, 26) to (139, 30).
; PLAN: r0=237(x1), r1=26(y1), r2=139(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 26
LDI r2, 139
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
