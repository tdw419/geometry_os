; DESCRIPTION: Renders a magenta line between points (378, 209) and (193, 39).
; PLAN: r0=378(x1), r1=209(y1), r2=193(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 209
LDI r2, 193
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
