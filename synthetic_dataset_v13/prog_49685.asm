; DESCRIPTION: Draws a magenta line from (213, 88) to (218, 230).
; PLAN: r0=213(x1), r1=88(y1), r2=218(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 88
LDI r2, 218
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
