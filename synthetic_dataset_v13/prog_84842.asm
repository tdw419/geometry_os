; DESCRIPTION: Renders a magenta line between points (275, 83) and (33, 158).
; PLAN: r0=275(x1), r1=83(y1), r2=33(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 83
LDI r2, 33
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
