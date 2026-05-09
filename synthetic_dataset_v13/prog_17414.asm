; DESCRIPTION: Places a red line segment connecting (237, 71) to (181, 98).
; PLAN: r0=237(x1), r1=71(y1), r2=181(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 71
LDI r2, 181
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
