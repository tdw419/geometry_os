; DESCRIPTION: Renders a red line between points (312, 73) and (384, 150).
; PLAN: r0=312(x1), r1=73(y1), r2=384(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 73
LDI r2, 384
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
