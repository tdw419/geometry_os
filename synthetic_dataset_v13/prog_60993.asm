; DESCRIPTION: Draws a blue line from (123, 191) to (33, 55).
; PLAN: r0=123(x1), r1=191(y1), r2=33(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 191
LDI r2, 33
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
