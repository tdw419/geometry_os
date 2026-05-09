; DESCRIPTION: Renders a cyan line between points (110, 48) and (232, 62).
; PLAN: r0=110(x1), r1=48(y1), r2=232(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 48
LDI r2, 232
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
