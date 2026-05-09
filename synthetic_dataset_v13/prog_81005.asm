; DESCRIPTION: Renders a cyan line between points (289, 77) and (76, 10).
; PLAN: r0=289(x1), r1=77(y1), r2=76(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 77
LDI r2, 76
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
