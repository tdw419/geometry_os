; DESCRIPTION: Renders a magenta line between points (76, 44) and (373, 134).
; PLAN: r0=76(x1), r1=44(y1), r2=373(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 44
LDI r2, 373
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
