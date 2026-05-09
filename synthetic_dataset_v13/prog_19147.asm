; DESCRIPTION: Renders a cyan line between points (122, 71) and (14, 184).
; PLAN: r0=122(x1), r1=71(y1), r2=14(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 71
LDI r2, 14
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
