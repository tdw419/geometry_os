; DESCRIPTION: Renders a black line between points (90, 247) and (185, 171).
; PLAN: r0=90(x1), r1=247(y1), r2=185(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 247
LDI r2, 185
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
