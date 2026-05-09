; DESCRIPTION: Draws a magenta line from (3, 112) to (14, 113).
; PLAN: r0=3(x1), r1=112(y1), r2=14(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 112
LDI r2, 14
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
