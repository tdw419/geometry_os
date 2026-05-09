; DESCRIPTION: Renders a magenta line between points (405, 141) and (318, 102).
; PLAN: r0=405(x1), r1=141(y1), r2=318(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 141
LDI r2, 318
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
