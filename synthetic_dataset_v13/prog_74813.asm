; DESCRIPTION: Renders a red line between points (432, 116) and (273, 239).
; PLAN: r0=432(x1), r1=116(y1), r2=273(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 116
LDI r2, 273
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
