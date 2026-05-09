; DESCRIPTION: Renders a white line between points (315, 32) and (145, 12).
; PLAN: r0=315(x1), r1=32(y1), r2=145(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 32
LDI r2, 145
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
