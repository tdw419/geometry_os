; DESCRIPTION: Renders a magenta line between points (56, 127) and (487, 118).
; PLAN: r0=56(x1), r1=127(y1), r2=487(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 127
LDI r2, 487
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
