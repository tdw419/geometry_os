; DESCRIPTION: Draws a blue line from (93, 239) to (75, 240).
; PLAN: r0=93(x1), r1=239(y1), r2=75(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 239
LDI r2, 75
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
