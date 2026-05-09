; DESCRIPTION: Renders a cyan line between points (212, 107) and (334, 85).
; PLAN: r0=212(x1), r1=107(y1), r2=334(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 107
LDI r2, 334
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
