; DESCRIPTION: Draws a magenta line from (510, 151) to (252, 13).
; PLAN: r0=510(x1), r1=151(y1), r2=252(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 151
LDI r2, 252
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
