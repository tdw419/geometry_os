; DESCRIPTION: Places a purple line segment connecting (305, 107) to (206, 44).
; PLAN: r0=305(x1), r1=107(y1), r2=206(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 107
LDI r2, 206
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
