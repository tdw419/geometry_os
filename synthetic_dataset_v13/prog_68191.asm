; DESCRIPTION: Draws a blue line from (72, 168) to (267, 59).
; PLAN: r0=72(x1), r1=168(y1), r2=267(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 168
LDI r2, 267
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
