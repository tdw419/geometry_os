; DESCRIPTION: Renders a magenta line between points (455, 162) and (28, 132).
; PLAN: r0=455(x1), r1=162(y1), r2=28(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 162
LDI r2, 28
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
