; DESCRIPTION: Draws a blue line from (210, 246) to (470, 114).
; PLAN: r0=210(x1), r1=246(y1), r2=470(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 246
LDI r2, 470
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
