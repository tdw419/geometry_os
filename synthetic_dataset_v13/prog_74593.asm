; DESCRIPTION: Renders a blue line between points (281, 181) and (267, 67).
; PLAN: r0=281(x1), r1=181(y1), r2=267(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 181
LDI r2, 267
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
