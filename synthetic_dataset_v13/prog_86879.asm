; DESCRIPTION: Renders a cyan line between points (78, 107) and (55, 1).
; PLAN: r0=78(x1), r1=107(y1), r2=55(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 107
LDI r2, 55
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
