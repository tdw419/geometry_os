; DESCRIPTION: Renders a cyan line between points (339, 81) and (111, 23).
; PLAN: r0=339(x1), r1=81(y1), r2=111(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 81
LDI r2, 111
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
