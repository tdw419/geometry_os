; DESCRIPTION: Renders a white line between points (226, 240) and (473, 13).
; PLAN: r0=226(x1), r1=240(y1), r2=473(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 240
LDI r2, 473
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
