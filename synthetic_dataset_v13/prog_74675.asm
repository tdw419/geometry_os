; DESCRIPTION: Places a magenta line segment connecting (156, 243) to (247, 15).
; PLAN: r0=156(x1), r1=243(y1), r2=247(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 243
LDI r2, 247
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
