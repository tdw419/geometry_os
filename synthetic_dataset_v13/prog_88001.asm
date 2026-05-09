; DESCRIPTION: Draws a magenta line from (60, 87) to (495, 238).
; PLAN: r0=60(x1), r1=87(y1), r2=495(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 87
LDI r2, 495
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
