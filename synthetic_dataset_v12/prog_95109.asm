; DESCRIPTION: Renders a magenta line between points (165, 247) and (210, 52).
; PLAN: r0=165(x1), r1=247(y1), r2=210(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 247
LDI r2, 210
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
