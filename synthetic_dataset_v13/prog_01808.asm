; DESCRIPTION: Draws a blue line from (157, 44) to (86, 109).
; PLAN: r0=157(x1), r1=44(y1), r2=86(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 44
LDI r2, 86
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
