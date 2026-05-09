; DESCRIPTION: Draws a magenta line from (168, 127) to (101, 75).
; PLAN: r0=168(x1), r1=127(y1), r2=101(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 127
LDI r2, 101
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
