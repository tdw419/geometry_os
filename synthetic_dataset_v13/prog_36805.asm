; DESCRIPTION: Places a magenta line segment connecting (156, 51) to (499, 127).
; PLAN: r0=156(x1), r1=51(y1), r2=499(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 51
LDI r2, 499
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
