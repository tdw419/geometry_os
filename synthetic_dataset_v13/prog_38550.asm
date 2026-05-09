; DESCRIPTION: Draws a blue line from (419, 36) to (294, 87).
; PLAN: r0=419(x1), r1=36(y1), r2=294(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 36
LDI r2, 294
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
