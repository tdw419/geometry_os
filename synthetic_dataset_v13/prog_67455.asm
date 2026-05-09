; DESCRIPTION: Renders a blue line between points (307, 112) and (509, 90).
; PLAN: r0=307(x1), r1=112(y1), r2=509(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 112
LDI r2, 509
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
