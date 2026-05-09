; DESCRIPTION: Draws a blue line from (382, 196) to (335, 169).
; PLAN: r0=382(x1), r1=196(y1), r2=335(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 196
LDI r2, 335
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
