; DESCRIPTION: Renders a magenta line between points (468, 233) and (209, 127).
; PLAN: r0=468(x1), r1=233(y1), r2=209(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 233
LDI r2, 209
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
