; DESCRIPTION: Draws a magenta line from (74, 181) to (269, 152).
; PLAN: r0=74(x1), r1=181(y1), r2=269(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 181
LDI r2, 269
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
