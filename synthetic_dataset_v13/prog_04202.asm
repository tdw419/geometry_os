; DESCRIPTION: Renders a cyan line between points (17, 28) and (101, 11).
; PLAN: r0=17(x1), r1=28(y1), r2=101(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 28
LDI r2, 101
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
