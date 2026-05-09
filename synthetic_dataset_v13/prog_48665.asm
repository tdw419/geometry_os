; DESCRIPTION: Draws a magenta line from (69, 214) to (86, 208).
; PLAN: r0=69(x1), r1=214(y1), r2=86(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 214
LDI r2, 86
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
