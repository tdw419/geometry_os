; DESCRIPTION: Draws a magenta line from (473, 116) to (426, 156).
; PLAN: r0=473(x1), r1=116(y1), r2=426(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 116
LDI r2, 426
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
