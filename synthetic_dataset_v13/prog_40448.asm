; DESCRIPTION: Draws a magenta line from (330, 25) to (127, 17).
; PLAN: r0=330(x1), r1=25(y1), r2=127(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 25
LDI r2, 127
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
