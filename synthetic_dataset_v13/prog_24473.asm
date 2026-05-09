; DESCRIPTION: Renders a cyan line between points (43, 101) and (238, 56).
; PLAN: r0=43(x1), r1=101(y1), r2=238(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 101
LDI r2, 238
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
