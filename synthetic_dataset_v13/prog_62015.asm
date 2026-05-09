; DESCRIPTION: Renders a blue line between points (240, 238) and (235, 21).
; PLAN: r0=240(x1), r1=238(y1), r2=235(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 238
LDI r2, 235
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
