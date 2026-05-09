; DESCRIPTION: Renders a magenta line between points (59, 1) and (488, 97).
; PLAN: r0=59(x1), r1=1(y1), r2=488(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 1
LDI r2, 488
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
