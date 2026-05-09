; DESCRIPTION: Renders a magenta line between points (156, 122) and (120, 223).
; PLAN: r0=156(x1), r1=122(y1), r2=120(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 122
LDI r2, 120
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
