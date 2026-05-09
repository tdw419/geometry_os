; DESCRIPTION: Renders a cyan line between points (458, 95) and (85, 101).
; PLAN: r0=458(x1), r1=95(y1), r2=85(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 95
LDI r2, 85
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
