; DESCRIPTION: Draws a magenta line from (285, 57) to (138, 198).
; PLAN: r0=285(x1), r1=57(y1), r2=138(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 57
LDI r2, 138
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
