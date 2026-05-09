; DESCRIPTION: Renders a blue line between points (180, 173) and (163, 126).
; PLAN: r0=180(x1), r1=173(y1), r2=163(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 173
LDI r2, 163
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
