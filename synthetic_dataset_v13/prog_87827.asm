; DESCRIPTION: Renders a cyan line between points (472, 235) and (461, 176).
; PLAN: r0=472(x1), r1=235(y1), r2=461(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 235
LDI r2, 461
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
