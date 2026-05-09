; DESCRIPTION: Places a black line segment connecting (140, 243) to (414, 168).
; PLAN: r0=140(x1), r1=243(y1), r2=414(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 243
LDI r2, 414
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
