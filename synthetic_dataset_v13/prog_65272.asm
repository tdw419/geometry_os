; DESCRIPTION: Renders a blue line between points (75, 151) and (412, 63).
; PLAN: r0=75(x1), r1=151(y1), r2=412(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 151
LDI r2, 412
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
