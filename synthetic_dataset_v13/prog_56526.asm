; DESCRIPTION: Renders a white line between points (365, 36) and (175, 4).
; PLAN: r0=365(x1), r1=36(y1), r2=175(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 36
LDI r2, 175
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
