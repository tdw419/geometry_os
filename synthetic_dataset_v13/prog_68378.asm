; DESCRIPTION: Renders a cyan line between points (4, 10) and (192, 18).
; PLAN: r0=4(x1), r1=10(y1), r2=192(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 10
LDI r2, 192
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
