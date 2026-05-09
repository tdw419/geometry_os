; DESCRIPTION: Renders a red line between points (482, 109) and (384, 116).
; PLAN: r0=482(x1), r1=109(y1), r2=384(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 109
LDI r2, 384
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
