; DESCRIPTION: Places a blue line segment connecting (417, 182) to (285, 208).
; PLAN: r0=417(x1), r1=182(y1), r2=285(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 182
LDI r2, 285
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
