; DESCRIPTION: Places a magenta line segment connecting (82, 97) to (72, 144).
; PLAN: r0=82(x1), r1=97(y1), r2=72(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 97
LDI r2, 72
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
