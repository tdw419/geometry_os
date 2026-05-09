; DESCRIPTION: Draws a magenta line from (233, 75) to (185, 113).
; PLAN: r0=233(x1), r1=75(y1), r2=185(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 75
LDI r2, 185
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
