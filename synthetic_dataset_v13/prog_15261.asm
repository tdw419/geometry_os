; DESCRIPTION: Draws a magenta line from (104, 132) to (403, 77).
; PLAN: r0=104(x1), r1=132(y1), r2=403(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 403
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
