; DESCRIPTION: Renders a cyan line between points (461, 76) and (494, 148).
; PLAN: r0=461(x1), r1=76(y1), r2=494(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 76
LDI r2, 494
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
