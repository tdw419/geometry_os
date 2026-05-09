; DESCRIPTION: Renders a white line between points (206, 23) and (230, 235).
; PLAN: r0=206(x1), r1=23(y1), r2=230(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 23
LDI r2, 230
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
