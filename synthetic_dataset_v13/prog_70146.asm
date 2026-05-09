; DESCRIPTION: Renders a white line between points (279, 48) and (215, 235).
; PLAN: r0=279(x1), r1=48(y1), r2=215(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 48
LDI r2, 215
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
