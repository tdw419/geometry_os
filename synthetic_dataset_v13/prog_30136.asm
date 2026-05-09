; DESCRIPTION: Draws a blue line from (299, 64) to (49, 37).
; PLAN: r0=299(x1), r1=64(y1), r2=49(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 64
LDI r2, 49
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
