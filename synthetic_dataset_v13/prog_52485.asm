; DESCRIPTION: Draws a magenta line from (9, 176) to (477, 198).
; PLAN: r0=9(x1), r1=176(y1), r2=477(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 176
LDI r2, 477
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
