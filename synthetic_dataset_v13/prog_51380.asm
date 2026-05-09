; DESCRIPTION: Places a red line segment connecting (358, 199) to (175, 243).
; PLAN: r0=358(x1), r1=199(y1), r2=175(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 199
LDI r2, 175
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
