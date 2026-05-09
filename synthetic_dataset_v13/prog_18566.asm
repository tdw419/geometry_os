; DESCRIPTION: Draws a blue line from (91, 114) to (70, 24).
; PLAN: r0=91(x1), r1=114(y1), r2=70(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 114
LDI r2, 70
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
