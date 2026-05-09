; DESCRIPTION: Draws a blue line from (22, 80) to (56, 42).
; PLAN: r0=22(x1), r1=80(y1), r2=56(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 80
LDI r2, 56
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
