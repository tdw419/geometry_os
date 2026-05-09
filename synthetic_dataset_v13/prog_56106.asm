; DESCRIPTION: Renders a magenta line between points (343, 88) and (405, 83).
; PLAN: r0=343(x1), r1=88(y1), r2=405(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 88
LDI r2, 405
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
