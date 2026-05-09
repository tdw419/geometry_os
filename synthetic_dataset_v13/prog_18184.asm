; DESCRIPTION: Draws a blue line from (155, 233) to (320, 190).
; PLAN: r0=155(x1), r1=233(y1), r2=320(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 233
LDI r2, 320
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
