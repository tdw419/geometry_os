; DESCRIPTION: Renders a black line between points (53, 174) and (107, 143).
; PLAN: r0=53(x1), r1=174(y1), r2=107(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 174
LDI r2, 107
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
