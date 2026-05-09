; DESCRIPTION: Renders a magenta line between points (2, 114) and (146, 167).
; PLAN: r0=2(x1), r1=114(y1), r2=146(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 114
LDI r2, 146
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
