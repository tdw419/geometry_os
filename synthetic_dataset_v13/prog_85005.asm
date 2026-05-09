; DESCRIPTION: Renders a magenta line between points (117, 57) and (471, 143).
; PLAN: r0=117(x1), r1=57(y1), r2=471(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 57
LDI r2, 471
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
