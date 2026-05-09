; DESCRIPTION: Renders a white line between points (173, 235) and (90, 217).
; PLAN: r0=173(x1), r1=235(y1), r2=90(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 235
LDI r2, 90
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
