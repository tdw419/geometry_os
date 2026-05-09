; DESCRIPTION: Renders a red line between points (384, 192) and (419, 47).
; PLAN: r0=384(x1), r1=192(y1), r2=419(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 192
LDI r2, 419
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
