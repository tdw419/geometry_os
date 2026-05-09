; DESCRIPTION: Places a green line segment connecting (199, 107) to (237, 87).
; PLAN: r0=199(x1), r1=107(y1), r2=237(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 107
LDI r2, 237
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
