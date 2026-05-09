; DESCRIPTION: Renders a white line between points (190, 192) and (32, 121).
; PLAN: r0=190(x1), r1=192(y1), r2=32(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 192
LDI r2, 32
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
