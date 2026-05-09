; DESCRIPTION: Places a blue line segment connecting (217, 184) to (71, 141).
; PLAN: r0=217(x1), r1=184(y1), r2=71(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 184
LDI r2, 71
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
