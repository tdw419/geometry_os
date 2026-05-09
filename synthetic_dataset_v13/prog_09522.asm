; DESCRIPTION: Renders a red line between points (494, 122) and (48, 18).
; PLAN: r0=494(x1), r1=122(y1), r2=48(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 122
LDI r2, 48
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
