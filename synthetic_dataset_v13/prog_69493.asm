; DESCRIPTION: Places a magenta line segment connecting (92, 255) to (307, 124).
; PLAN: r0=92(x1), r1=255(y1), r2=307(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 255
LDI r2, 307
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
