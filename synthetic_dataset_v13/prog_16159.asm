; DESCRIPTION: Renders a cyan line between points (33, 216) and (119, 43).
; PLAN: r0=33(x1), r1=216(y1), r2=119(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 216
LDI r2, 119
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
