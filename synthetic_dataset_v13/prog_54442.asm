; DESCRIPTION: Places a magenta line segment connecting (81, 94) to (405, 127).
; PLAN: r0=81(x1), r1=94(y1), r2=405(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 94
LDI r2, 405
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
