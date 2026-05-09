; DESCRIPTION: Renders a cyan line between points (29, 62) and (105, 45).
; PLAN: r0=29(x1), r1=62(y1), r2=105(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 62
LDI r2, 105
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
