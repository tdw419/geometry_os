; DESCRIPTION: Draws a red line from (389, 42) to (84, 237).
; PLAN: r0=389(x1), r1=42(y1), r2=84(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 42
LDI r2, 84
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
