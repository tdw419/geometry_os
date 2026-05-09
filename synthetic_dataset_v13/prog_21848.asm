; DESCRIPTION: Draws a blue line from (245, 130) to (419, 139).
; PLAN: r0=245(x1), r1=130(y1), r2=419(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 130
LDI r2, 419
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
