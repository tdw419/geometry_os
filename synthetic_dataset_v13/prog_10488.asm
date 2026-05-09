; DESCRIPTION: Renders a cyan line between points (78, 235) and (59, 237).
; PLAN: r0=78(x1), r1=235(y1), r2=59(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 235
LDI r2, 59
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
