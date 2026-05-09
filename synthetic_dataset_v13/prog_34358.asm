; DESCRIPTION: Renders a blue line between points (299, 33) and (506, 173).
; PLAN: r0=299(x1), r1=33(y1), r2=506(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 33
LDI r2, 506
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
