; DESCRIPTION: Draws a magenta line from (391, 34) to (460, 252).
; PLAN: r0=391(x1), r1=34(y1), r2=460(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 34
LDI r2, 460
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
