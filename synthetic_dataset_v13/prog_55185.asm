; DESCRIPTION: Places a green line segment connecting (349, 127) to (335, 169).
; PLAN: r0=349(x1), r1=127(y1), r2=335(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 127
LDI r2, 335
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
