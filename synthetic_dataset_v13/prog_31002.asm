; DESCRIPTION: Renders a blue line between points (64, 171) and (176, 173).
; PLAN: r0=64(x1), r1=171(y1), r2=176(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 171
LDI r2, 176
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
