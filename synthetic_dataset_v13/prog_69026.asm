; DESCRIPTION: Places a black line segment connecting (403, 133) to (182, 155).
; PLAN: r0=403(x1), r1=133(y1), r2=182(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 133
LDI r2, 182
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
