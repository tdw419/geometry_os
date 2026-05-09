; DESCRIPTION: Renders a red line between points (271, 116) and (219, 71).
; PLAN: r0=271(x1), r1=116(y1), r2=219(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 116
LDI r2, 219
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
