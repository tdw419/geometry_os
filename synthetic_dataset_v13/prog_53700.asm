; DESCRIPTION: Renders a magenta line between points (489, 209) and (339, 138).
; PLAN: r0=489(x1), r1=209(y1), r2=339(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 209
LDI r2, 339
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
