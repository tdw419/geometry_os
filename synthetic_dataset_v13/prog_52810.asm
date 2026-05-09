; DESCRIPTION: Places a cyan line segment connecting (314, 133) to (385, 48).
; PLAN: r0=314(x1), r1=133(y1), r2=385(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 133
LDI r2, 385
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
