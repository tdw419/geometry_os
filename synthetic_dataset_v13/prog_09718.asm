; DESCRIPTION: Places a purple line segment connecting (148, 177) to (308, 27).
; PLAN: r0=148(x1), r1=177(y1), r2=308(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 177
LDI r2, 308
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
