; DESCRIPTION: Renders a cyan line between points (181, 243) and (77, 184).
; PLAN: r0=181(x1), r1=243(y1), r2=77(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 243
LDI r2, 77
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
