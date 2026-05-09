; DESCRIPTION: Renders a white line between points (11, 64) and (226, 59).
; PLAN: r0=11(x1), r1=64(y1), r2=226(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 64
LDI r2, 226
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
