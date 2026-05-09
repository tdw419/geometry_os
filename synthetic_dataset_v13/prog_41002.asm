; DESCRIPTION: Places a magenta line segment connecting (127, 246) to (460, 57).
; PLAN: r0=127(x1), r1=246(y1), r2=460(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 246
LDI r2, 460
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
