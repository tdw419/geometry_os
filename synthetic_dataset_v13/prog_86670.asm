; DESCRIPTION: Renders a cyan line between points (285, 139) and (285, 162).
; PLAN: r0=285(x1), r1=139(y1), r2=285(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 139
LDI r2, 285
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
