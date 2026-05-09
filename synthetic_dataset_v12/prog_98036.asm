; DESCRIPTION: Draws a magenta line from (127, 116) to (251, 103).
; PLAN: r0=127(x1), r1=116(y1), r2=251(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 116
LDI r2, 251
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
