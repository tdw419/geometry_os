; DESCRIPTION: Draws a magenta line from (151, 72) to (326, 44).
; PLAN: r0=151(x1), r1=72(y1), r2=326(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 72
LDI r2, 326
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
