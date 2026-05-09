; DESCRIPTION: Renders a cyan line between points (406, 190) and (121, 37).
; PLAN: r0=406(x1), r1=190(y1), r2=121(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 190
LDI r2, 121
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
