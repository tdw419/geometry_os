; DESCRIPTION: Renders a green line between points (216, 0) and (434, 159).
; PLAN: r0=216(x1), r1=0(y1), r2=434(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 0
LDI r2, 434
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
