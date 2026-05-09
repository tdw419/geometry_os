; DESCRIPTION: Renders a cyan line between points (247, 198) and (190, 227).
; PLAN: r0=247(x1), r1=198(y1), r2=190(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 198
LDI r2, 190
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
