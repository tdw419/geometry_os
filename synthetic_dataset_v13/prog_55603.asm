; DESCRIPTION: Draws a magenta line from (127, 17) to (133, 198).
; PLAN: r0=127(x1), r1=17(y1), r2=133(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 17
LDI r2, 133
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
