; DESCRIPTION: Renders a purple line between points (64, 131) and (418, 95).
; PLAN: r0=64(x1), r1=131(y1), r2=418(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 131
LDI r2, 418
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
