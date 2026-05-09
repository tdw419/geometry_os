; DESCRIPTION: Places a green line segment connecting (358, 255) to (343, 51).
; PLAN: r0=358(x1), r1=255(y1), r2=343(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 255
LDI r2, 343
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
