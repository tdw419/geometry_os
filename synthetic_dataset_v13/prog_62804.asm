; DESCRIPTION: Renders a magenta line between points (501, 108) and (317, 52).
; PLAN: r0=501(x1), r1=108(y1), r2=317(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 108
LDI r2, 317
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
