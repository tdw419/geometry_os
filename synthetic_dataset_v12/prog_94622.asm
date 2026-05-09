; DESCRIPTION: Draws a blue line from (289, 46) to (419, 125).
; PLAN: r0=289(x1), r1=46(y1), r2=419(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 46
LDI r2, 419
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
