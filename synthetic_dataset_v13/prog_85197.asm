; DESCRIPTION: Draws a magenta line from (392, 86) to (111, 197).
; PLAN: r0=392(x1), r1=86(y1), r2=111(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 86
LDI r2, 111
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
