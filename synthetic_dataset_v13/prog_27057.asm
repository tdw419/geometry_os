; DESCRIPTION: Places a blue line segment connecting (48, 112) to (82, 141).
; PLAN: r0=48(x1), r1=112(y1), r2=82(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 112
LDI r2, 82
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
