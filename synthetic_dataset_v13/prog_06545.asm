; DESCRIPTION: Renders a cyan line between points (62, 91) and (258, 169).
; PLAN: r0=62(x1), r1=91(y1), r2=258(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 91
LDI r2, 258
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
