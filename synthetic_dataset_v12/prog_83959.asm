; DESCRIPTION: Draws a blue line from (101, 23) to (202, 169).
; PLAN: r0=101(x1), r1=23(y1), r2=202(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 23
LDI r2, 202
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
