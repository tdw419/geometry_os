; DESCRIPTION: Renders a magenta line between points (117, 202) and (151, 162).
; PLAN: r0=117(x1), r1=202(y1), r2=151(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 202
LDI r2, 151
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
