; DESCRIPTION: Draws a magenta line from (412, 101) to (141, 166).
; PLAN: r0=412(x1), r1=101(y1), r2=141(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 101
LDI r2, 141
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
