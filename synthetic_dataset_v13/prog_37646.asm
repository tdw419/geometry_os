; DESCRIPTION: Renders a black line between points (502, 207) and (250, 235).
; PLAN: r0=502(x1), r1=207(y1), r2=250(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 207
LDI r2, 250
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
