; DESCRIPTION: Renders a blue line between points (307, 163) and (270, 8).
; PLAN: r0=307(x1), r1=163(y1), r2=270(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 163
LDI r2, 270
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
