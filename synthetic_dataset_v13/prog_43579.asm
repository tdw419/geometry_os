; DESCRIPTION: Draws a blue line from (494, 113) to (292, 37).
; PLAN: r0=494(x1), r1=113(y1), r2=292(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 113
LDI r2, 292
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
