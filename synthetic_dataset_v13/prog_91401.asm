; DESCRIPTION: Renders a white line between points (74, 7) and (5, 138).
; PLAN: r0=74(x1), r1=7(y1), r2=5(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 7
LDI r2, 5
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
