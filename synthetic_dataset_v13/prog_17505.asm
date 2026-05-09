; DESCRIPTION: Renders a blue line between points (294, 235) and (485, 180).
; PLAN: r0=294(x1), r1=235(y1), r2=485(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 235
LDI r2, 485
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
