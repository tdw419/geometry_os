; DESCRIPTION: Renders a blue line between points (419, 33) and (428, 107).
; PLAN: r0=419(x1), r1=33(y1), r2=428(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 33
LDI r2, 428
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
