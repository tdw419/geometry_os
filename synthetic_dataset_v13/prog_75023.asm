; DESCRIPTION: Renders a cyan line between points (160, 115) and (190, 21).
; PLAN: r0=160(x1), r1=115(y1), r2=190(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 115
LDI r2, 190
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
