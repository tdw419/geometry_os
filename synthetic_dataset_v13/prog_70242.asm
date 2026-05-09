; DESCRIPTION: Renders a white line between points (235, 217) and (330, 37).
; PLAN: r0=235(x1), r1=217(y1), r2=330(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 217
LDI r2, 330
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
