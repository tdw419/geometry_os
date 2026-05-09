; DESCRIPTION: Places a white line segment connecting (195, 46) to (256, 139).
; PLAN: r0=195(x1), r1=46(y1), r2=256(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 46
LDI r2, 256
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
