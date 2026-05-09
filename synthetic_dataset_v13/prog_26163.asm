; DESCRIPTION: Draws a blue line from (157, 163) to (372, 68).
; PLAN: r0=157(x1), r1=163(y1), r2=372(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 163
LDI r2, 372
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
