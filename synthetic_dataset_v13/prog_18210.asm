; DESCRIPTION: Draws a magenta line from (196, 207) to (29, 223).
; PLAN: r0=196(x1), r1=207(y1), r2=29(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 207
LDI r2, 29
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
