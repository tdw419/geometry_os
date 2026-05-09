; DESCRIPTION: Draws a blue line from (144, 134) to (364, 64).
; PLAN: r0=144(x1), r1=134(y1), r2=364(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 134
LDI r2, 364
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
