; DESCRIPTION: Renders a white line between points (235, 99) and (74, 22).
; PLAN: r0=235(x1), r1=99(y1), r2=74(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 99
LDI r2, 74
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
