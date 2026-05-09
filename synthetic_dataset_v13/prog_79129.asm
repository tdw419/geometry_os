; DESCRIPTION: Places a black line segment connecting (133, 249) to (71, 50).
; PLAN: r0=133(x1), r1=249(y1), r2=71(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 249
LDI r2, 71
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
