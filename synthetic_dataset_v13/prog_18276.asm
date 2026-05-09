; DESCRIPTION: Renders a black line between points (143, 14) and (114, 209).
; PLAN: r0=143(x1), r1=14(y1), r2=114(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 14
LDI r2, 114
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
