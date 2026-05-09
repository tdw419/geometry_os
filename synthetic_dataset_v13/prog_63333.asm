; DESCRIPTION: Draws a blue line from (492, 220) to (192, 93).
; PLAN: r0=492(x1), r1=220(y1), r2=192(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 220
LDI r2, 192
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
