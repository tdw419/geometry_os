; DESCRIPTION: Renders a black line between points (119, 235) and (242, 113).
; PLAN: r0=119(x1), r1=235(y1), r2=242(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 235
LDI r2, 242
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
