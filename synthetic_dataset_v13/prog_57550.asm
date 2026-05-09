; DESCRIPTION: Renders a cyan line between points (51, 29) and (99, 190).
; PLAN: r0=51(x1), r1=29(y1), r2=99(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 29
LDI r2, 99
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
