; DESCRIPTION: Renders a blue line between points (397, 246) and (317, 170).
; PLAN: r0=397(x1), r1=246(y1), r2=317(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 246
LDI r2, 317
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
