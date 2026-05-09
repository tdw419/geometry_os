; DESCRIPTION: Renders a cyan line between points (324, 167) and (233, 114).
; PLAN: r0=324(x1), r1=167(y1), r2=233(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 167
LDI r2, 233
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
