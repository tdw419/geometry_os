; DESCRIPTION: Renders a cyan line between points (101, 1) and (411, 232).
; PLAN: r0=101(x1), r1=1(y1), r2=411(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 1
LDI r2, 411
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
