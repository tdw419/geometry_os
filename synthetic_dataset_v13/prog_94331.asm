; DESCRIPTION: Draws a blue line from (8, 36) to (367, 38).
; PLAN: r0=8(x1), r1=36(y1), r2=367(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 36
LDI r2, 367
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
