; DESCRIPTION: Renders a blue line between points (240, 171) and (426, 126).
; PLAN: r0=240(x1), r1=171(y1), r2=426(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 171
LDI r2, 426
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
