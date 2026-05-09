; DESCRIPTION: Renders a red line between points (402, 14) and (69, 241).
; PLAN: r0=402(x1), r1=14(y1), r2=69(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 14
LDI r2, 69
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
