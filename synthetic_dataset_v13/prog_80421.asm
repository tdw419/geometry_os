; DESCRIPTION: Draws a magenta line from (197, 160) to (337, 17).
; PLAN: r0=197(x1), r1=160(y1), r2=337(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 160
LDI r2, 337
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
