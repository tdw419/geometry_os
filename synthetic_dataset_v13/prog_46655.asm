; DESCRIPTION: Renders a magenta line between points (197, 18) and (243, 153).
; PLAN: r0=197(x1), r1=18(y1), r2=243(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 18
LDI r2, 243
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
