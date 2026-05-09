; DESCRIPTION: Renders a cyan line between points (254, 62) and (153, 102).
; PLAN: r0=254(x1), r1=62(y1), r2=153(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 62
LDI r2, 153
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
