; DESCRIPTION: Draws a blue line from (486, 176) to (299, 12).
; PLAN: r0=486(x1), r1=176(y1), r2=299(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 176
LDI r2, 299
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
