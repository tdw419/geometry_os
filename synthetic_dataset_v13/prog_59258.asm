; DESCRIPTION: Draws a magenta line from (127, 23) to (218, 74).
; PLAN: r0=127(x1), r1=23(y1), r2=218(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 23
LDI r2, 218
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
