; DESCRIPTION: Places a cyan line segment connecting (254, 133) to (314, 237).
; PLAN: r0=254(x1), r1=133(y1), r2=314(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 133
LDI r2, 314
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
