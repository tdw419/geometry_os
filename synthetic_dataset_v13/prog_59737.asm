; DESCRIPTION: Renders a white line between points (27, 6) and (216, 12).
; PLAN: r0=27(x1), r1=6(y1), r2=216(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 6
LDI r2, 216
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
