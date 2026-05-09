; DESCRIPTION: Draws a blue line from (42, 144) to (419, 131).
; PLAN: r0=42(x1), r1=144(y1), r2=419(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 144
LDI r2, 419
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
