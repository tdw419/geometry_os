; DESCRIPTION: Renders a white line between points (209, 96) and (233, 54).
; PLAN: r0=209(x1), r1=96(y1), r2=233(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 96
LDI r2, 233
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
