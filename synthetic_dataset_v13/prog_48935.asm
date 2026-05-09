; DESCRIPTION: Renders a blue line between points (5, 176) and (396, 173).
; PLAN: r0=5(x1), r1=176(y1), r2=396(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 176
LDI r2, 396
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
