; DESCRIPTION: Draws a blue line from (455, 19) to (114, 225).
; PLAN: r0=455(x1), r1=19(y1), r2=114(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 19
LDI r2, 114
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
