; DESCRIPTION: Draws a magenta line from (71, 218) to (127, 103).
; PLAN: r0=71(x1), r1=218(y1), r2=127(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 218
LDI r2, 127
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
