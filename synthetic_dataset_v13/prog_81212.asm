; DESCRIPTION: Renders a cyan line between points (159, 138) and (303, 71).
; PLAN: r0=159(x1), r1=138(y1), r2=303(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 303
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
