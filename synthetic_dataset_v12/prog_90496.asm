; DESCRIPTION: Renders a cyan line between points (494, 25) and (17, 227).
; PLAN: r0=494(x1), r1=25(y1), r2=17(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 25
LDI r2, 17
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
