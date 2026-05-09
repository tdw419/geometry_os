; DESCRIPTION: Renders a cyan line between points (91, 139) and (118, 203).
; PLAN: r0=91(x1), r1=139(y1), r2=118(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 139
LDI r2, 118
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
