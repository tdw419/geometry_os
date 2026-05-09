; DESCRIPTION: Renders a cyan line between points (364, 0) and (343, 203).
; PLAN: r0=364(x1), r1=0(y1), r2=343(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 0
LDI r2, 343
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
