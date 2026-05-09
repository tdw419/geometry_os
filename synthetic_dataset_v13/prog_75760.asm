; DESCRIPTION: Renders a white line between points (494, 131) and (68, 84).
; PLAN: r0=494(x1), r1=131(y1), r2=68(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 131
LDI r2, 68
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
