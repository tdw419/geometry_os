; DESCRIPTION: Places a magenta line segment connecting (239, 51) to (127, 78).
; PLAN: r0=239(x1), r1=51(y1), r2=127(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 51
LDI r2, 127
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
