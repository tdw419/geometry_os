; DESCRIPTION: Places a cyan line segment connecting (264, 169) to (349, 217).
; PLAN: r0=264(x1), r1=169(y1), r2=349(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 169
LDI r2, 349
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
