; DESCRIPTION: Draws a magenta line from (121, 225) to (277, 67).
; PLAN: r0=121(x1), r1=225(y1), r2=277(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 225
LDI r2, 277
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
