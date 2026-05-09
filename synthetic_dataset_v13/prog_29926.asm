; DESCRIPTION: Renders a black line between points (24, 236) and (165, 171).
; PLAN: r0=24(x1), r1=236(y1), r2=165(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 236
LDI r2, 165
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
