; DESCRIPTION: Places a magenta line segment connecting (57, 166) to (486, 53).
; PLAN: r0=57(x1), r1=166(y1), r2=486(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 166
LDI r2, 486
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
