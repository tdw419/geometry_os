; DESCRIPTION: Renders a black line between points (61, 235) and (382, 143).
; PLAN: r0=61(x1), r1=235(y1), r2=382(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 235
LDI r2, 382
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
