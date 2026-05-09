; DESCRIPTION: Draws a cyan line from (335, 105) to (142, 140).
; PLAN: r0=335(x1), r1=105(y1), r2=142(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 105
LDI r2, 142
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
