; DESCRIPTION: Renders a magenta line between points (426, 241) and (87, 108).
; PLAN: r0=426(x1), r1=241(y1), r2=87(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 241
LDI r2, 87
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
