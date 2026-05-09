; DESCRIPTION: Draws a blue line from (105, 42) to (12, 58).
; PLAN: r0=105(x1), r1=42(y1), r2=12(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 42
LDI r2, 12
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
