; DESCRIPTION: Places a magenta line segment connecting (29, 182) to (354, 101).
; PLAN: r0=29(x1), r1=182(y1), r2=354(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 182
LDI r2, 354
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
