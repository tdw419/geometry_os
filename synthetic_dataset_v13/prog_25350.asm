; DESCRIPTION: Renders a magenta line between points (291, 210) and (162, 132).
; PLAN: r0=291(x1), r1=210(y1), r2=162(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 210
LDI r2, 162
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
