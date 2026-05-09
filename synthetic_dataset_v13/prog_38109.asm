; DESCRIPTION: Renders a green line between points (447, 28) and (315, 140).
; PLAN: r0=447(x1), r1=28(y1), r2=315(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 28
LDI r2, 315
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
