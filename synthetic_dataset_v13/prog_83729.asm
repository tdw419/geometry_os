; DESCRIPTION: Draws a blue line from (385, 243) to (119, 42).
; PLAN: r0=385(x1), r1=243(y1), r2=119(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 243
LDI r2, 119
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
