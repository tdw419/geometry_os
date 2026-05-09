; DESCRIPTION: Draws a blue line from (69, 103) to (72, 208).
; PLAN: r0=69(x1), r1=103(y1), r2=72(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 103
LDI r2, 72
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
