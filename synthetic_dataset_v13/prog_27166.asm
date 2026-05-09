; DESCRIPTION: Renders a cyan line between points (34, 43) and (2, 80).
; PLAN: r0=34(x1), r1=43(y1), r2=2(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 43
LDI r2, 2
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
