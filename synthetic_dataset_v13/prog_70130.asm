; DESCRIPTION: Renders a magenta line between points (455, 29) and (262, 178).
; PLAN: r0=455(x1), r1=29(y1), r2=262(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 29
LDI r2, 262
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
