; DESCRIPTION: Places a blue line segment connecting (48, 147) to (358, 95).
; PLAN: r0=48(x1), r1=147(y1), r2=358(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 147
LDI r2, 358
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
