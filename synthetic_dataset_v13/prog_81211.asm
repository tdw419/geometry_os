; DESCRIPTION: Renders a magenta line between points (265, 62) and (468, 56).
; PLAN: r0=265(x1), r1=62(y1), r2=468(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 62
LDI r2, 468
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
