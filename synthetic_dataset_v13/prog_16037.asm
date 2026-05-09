; DESCRIPTION: Draws a blue line from (329, 88) to (335, 174).
; PLAN: r0=329(x1), r1=88(y1), r2=335(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 88
LDI r2, 335
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
