; DESCRIPTION: Places a blue line segment connecting (249, 167) to (434, 82).
; PLAN: r0=249(x1), r1=167(y1), r2=434(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 167
LDI r2, 434
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
