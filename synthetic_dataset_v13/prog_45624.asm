; DESCRIPTION: Renders a black line between points (458, 44) and (239, 235).
; PLAN: r0=458(x1), r1=44(y1), r2=239(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 44
LDI r2, 239
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
