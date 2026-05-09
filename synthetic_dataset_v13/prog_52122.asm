; DESCRIPTION: Renders a cyan line between points (425, 51) and (71, 235).
; PLAN: r0=425(x1), r1=51(y1), r2=71(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 51
LDI r2, 71
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
