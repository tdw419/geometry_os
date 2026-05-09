; DESCRIPTION: Renders a black line between points (445, 235) and (2, 55).
; PLAN: r0=445(x1), r1=235(y1), r2=2(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 235
LDI r2, 2
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
