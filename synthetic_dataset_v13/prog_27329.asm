; DESCRIPTION: Renders a magenta line between points (230, 142) and (455, 103).
; PLAN: r0=230(x1), r1=142(y1), r2=455(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 142
LDI r2, 455
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
