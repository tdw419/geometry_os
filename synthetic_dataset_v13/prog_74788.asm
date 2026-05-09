; DESCRIPTION: Renders a magenta line between points (508, 132) and (344, 67).
; PLAN: r0=508(x1), r1=132(y1), r2=344(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 132
LDI r2, 344
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
