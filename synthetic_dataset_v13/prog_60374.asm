; DESCRIPTION: Renders a magenta line between points (449, 168) and (217, 29).
; PLAN: r0=449(x1), r1=168(y1), r2=217(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 168
LDI r2, 217
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
