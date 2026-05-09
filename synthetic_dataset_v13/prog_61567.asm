; DESCRIPTION: Places a cyan line segment connecting (226, 254) to (417, 69).
; PLAN: r0=226(x1), r1=254(y1), r2=417(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 254
LDI r2, 417
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
