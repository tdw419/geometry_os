; DESCRIPTION: Renders a white line between points (177, 235) and (132, 61).
; PLAN: r0=177(x1), r1=235(y1), r2=132(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 235
LDI r2, 132
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
