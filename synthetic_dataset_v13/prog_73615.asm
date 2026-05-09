; DESCRIPTION: Draws a blue line from (186, 96) to (426, 118).
; PLAN: r0=186(x1), r1=96(y1), r2=426(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 96
LDI r2, 426
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
