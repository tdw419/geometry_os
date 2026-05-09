; DESCRIPTION: Draws a magenta line from (28, 214) to (122, 221).
; PLAN: r0=28(x1), r1=214(y1), r2=122(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 214
LDI r2, 122
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
