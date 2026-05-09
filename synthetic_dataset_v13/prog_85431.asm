; DESCRIPTION: Renders a magenta line between points (90, 12) and (294, 217).
; PLAN: r0=90(x1), r1=12(y1), r2=294(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 12
LDI r2, 294
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
