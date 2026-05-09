; DESCRIPTION: Renders a cyan line between points (458, 5) and (148, 137).
; PLAN: r0=458(x1), r1=5(y1), r2=148(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 5
LDI r2, 148
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
