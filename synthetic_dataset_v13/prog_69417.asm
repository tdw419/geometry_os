; DESCRIPTION: Renders a purple line between points (383, 224) and (92, 33).
; PLAN: r0=383(x1), r1=224(y1), r2=92(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 224
LDI r2, 92
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
