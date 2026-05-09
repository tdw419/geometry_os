; DESCRIPTION: Places a green line segment connecting (388, 190) to (237, 64).
; PLAN: r0=388(x1), r1=190(y1), r2=237(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 190
LDI r2, 237
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
