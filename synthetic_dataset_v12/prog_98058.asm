; DESCRIPTION: Renders a black line between points (143, 254) and (202, 118).
; PLAN: r0=143(x1), r1=254(y1), r2=202(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 254
LDI r2, 202
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
