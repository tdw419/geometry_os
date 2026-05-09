; DESCRIPTION: Renders a red line between points (316, 128) and (108, 5).
; PLAN: r0=316(x1), r1=128(y1), r2=108(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 128
LDI r2, 108
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
