; DESCRIPTION: Renders a cyan line between points (22, 2) and (251, 100).
; PLAN: r0=22(x1), r1=2(y1), r2=251(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 2
LDI r2, 251
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
