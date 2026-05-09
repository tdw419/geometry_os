; DESCRIPTION: Renders a white line between points (488, 96) and (17, 235).
; PLAN: r0=488(x1), r1=96(y1), r2=17(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 96
LDI r2, 17
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
