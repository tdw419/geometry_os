; DESCRIPTION: Renders a black line between points (168, 77) and (230, 134).
; PLAN: r0=168(x1), r1=77(y1), r2=230(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 77
LDI r2, 230
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
