; DESCRIPTION: Renders a magenta line between points (419, 97) and (135, 241).
; PLAN: r0=419(x1), r1=97(y1), r2=135(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 97
LDI r2, 135
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
