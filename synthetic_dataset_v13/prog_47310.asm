; DESCRIPTION: Renders a cyan line between points (62, 82) and (175, 123).
; PLAN: r0=62(x1), r1=82(y1), r2=175(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 82
LDI r2, 175
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
