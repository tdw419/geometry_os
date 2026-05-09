; DESCRIPTION: Renders a cyan line between points (498, 90) and (2, 162).
; PLAN: r0=498(x1), r1=90(y1), r2=2(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 90
LDI r2, 2
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
