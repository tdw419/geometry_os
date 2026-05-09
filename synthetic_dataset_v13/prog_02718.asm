; DESCRIPTION: Renders a white line between points (240, 83) and (457, 120).
; PLAN: r0=240(x1), r1=83(y1), r2=457(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 83
LDI r2, 457
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
