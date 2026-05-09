; DESCRIPTION: Renders a magenta line between points (123, 5) and (366, 202).
; PLAN: r0=123(x1), r1=5(y1), r2=366(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 5
LDI r2, 366
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
