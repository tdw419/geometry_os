; DESCRIPTION: Draws a blue line from (335, 210) to (290, 184).
; PLAN: r0=335(x1), r1=210(y1), r2=290(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 210
LDI r2, 290
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
