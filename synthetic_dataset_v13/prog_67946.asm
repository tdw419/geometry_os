; DESCRIPTION: Draws a magenta line from (47, 252) to (508, 213).
; PLAN: r0=47(x1), r1=252(y1), r2=508(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 252
LDI r2, 508
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
