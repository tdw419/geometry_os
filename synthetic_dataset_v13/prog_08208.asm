; DESCRIPTION: Renders a white line between points (473, 126) and (466, 196).
; PLAN: r0=473(x1), r1=126(y1), r2=466(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 126
LDI r2, 466
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
