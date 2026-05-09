; DESCRIPTION: Renders a black line between points (247, 80) and (153, 125).
; PLAN: r0=247(x1), r1=80(y1), r2=153(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 80
LDI r2, 153
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
