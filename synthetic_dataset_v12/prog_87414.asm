; DESCRIPTION: Draws a magenta line from (67, 13) to (77, 80).
; PLAN: r0=67(x1), r1=13(y1), r2=77(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 13
LDI r2, 77
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
