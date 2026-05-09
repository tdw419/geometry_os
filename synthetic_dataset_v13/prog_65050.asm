; DESCRIPTION: Renders a red line between points (18, 115) and (469, 12).
; PLAN: r0=18(x1), r1=115(y1), r2=469(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 115
LDI r2, 469
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
