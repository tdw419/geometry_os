; DESCRIPTION: Renders a red line between points (384, 121) and (304, 147).
; PLAN: r0=384(x1), r1=121(y1), r2=304(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 121
LDI r2, 304
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
