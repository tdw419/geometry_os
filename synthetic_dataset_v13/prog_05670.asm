; DESCRIPTION: Places a black line segment connecting (415, 107) to (190, 205).
; PLAN: r0=415(x1), r1=107(y1), r2=190(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 107
LDI r2, 190
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
