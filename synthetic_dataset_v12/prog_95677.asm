; DESCRIPTION: Renders a purple line between points (283, 131) and (397, 186).
; PLAN: r0=283(x1), r1=131(y1), r2=397(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 131
LDI r2, 397
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
