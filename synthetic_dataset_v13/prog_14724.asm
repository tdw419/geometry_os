; DESCRIPTION: Renders a blue line between points (123, 246) and (370, 127).
; PLAN: r0=123(x1), r1=246(y1), r2=370(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 246
LDI r2, 370
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
