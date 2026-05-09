; DESCRIPTION: Renders a cyan line between points (114, 86) and (494, 100).
; PLAN: r0=114(x1), r1=86(y1), r2=494(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 86
LDI r2, 494
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
