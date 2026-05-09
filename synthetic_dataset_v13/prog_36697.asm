; DESCRIPTION: Places a magenta line segment connecting (190, 240) to (124, 213).
; PLAN: r0=190(x1), r1=240(y1), r2=124(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 240
LDI r2, 124
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
