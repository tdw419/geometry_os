; DESCRIPTION: Renders a magenta line between points (74, 226) and (220, 108).
; PLAN: r0=74(x1), r1=226(y1), r2=220(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 226
LDI r2, 220
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
