; DESCRIPTION: Draws a magenta line from (313, 233) to (508, 157).
; PLAN: r0=313(x1), r1=233(y1), r2=508(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 233
LDI r2, 508
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
