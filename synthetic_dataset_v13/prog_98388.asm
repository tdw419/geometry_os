; DESCRIPTION: Renders a blue line between points (427, 39) and (128, 59).
; PLAN: r0=427(x1), r1=39(y1), r2=128(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 39
LDI r2, 128
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
