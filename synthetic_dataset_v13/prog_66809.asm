; DESCRIPTION: Renders a blue line between points (59, 240) and (281, 77).
; PLAN: r0=59(x1), r1=240(y1), r2=281(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 240
LDI r2, 281
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
