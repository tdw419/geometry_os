; DESCRIPTION: Draws a green line from (315, 77) to (245, 106).
; PLAN: r0=315(x1), r1=77(y1), r2=245(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 77
LDI r2, 245
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
