; DESCRIPTION: Renders a blue line between points (434, 159) and (0, 8).
; PLAN: r0=434(x1), r1=159(y1), r2=0(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 159
LDI r2, 0
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
