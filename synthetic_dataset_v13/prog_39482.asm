; DESCRIPTION: Draws a magenta line from (222, 59) to (507, 141).
; PLAN: r0=222(x1), r1=59(y1), r2=507(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 59
LDI r2, 507
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
