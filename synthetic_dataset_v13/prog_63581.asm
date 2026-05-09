; DESCRIPTION: Renders a magenta line between points (33, 248) and (426, 126).
; PLAN: r0=33(x1), r1=248(y1), r2=426(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 248
LDI r2, 426
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
