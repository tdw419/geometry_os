; DESCRIPTION: Draws a blue line from (344, 144) to (195, 118).
; PLAN: r0=344(x1), r1=144(y1), r2=195(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 144
LDI r2, 195
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
