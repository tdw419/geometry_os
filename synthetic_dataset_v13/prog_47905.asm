; DESCRIPTION: Renders a cyan line between points (102, 38) and (86, 155).
; PLAN: r0=102(x1), r1=38(y1), r2=86(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 38
LDI r2, 86
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
