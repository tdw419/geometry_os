; DESCRIPTION: Draws a blue line from (102, 191) to (328, 23).
; PLAN: r0=102(x1), r1=191(y1), r2=328(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 191
LDI r2, 328
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
