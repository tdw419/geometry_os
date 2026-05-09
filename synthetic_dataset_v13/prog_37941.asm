; DESCRIPTION: Draws a blue line from (380, 42) to (89, 254).
; PLAN: r0=380(x1), r1=42(y1), r2=89(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 42
LDI r2, 89
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
