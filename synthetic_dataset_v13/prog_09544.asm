; DESCRIPTION: Draws a blue line from (42, 238) to (389, 255).
; PLAN: r0=42(x1), r1=238(y1), r2=389(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 238
LDI r2, 389
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
