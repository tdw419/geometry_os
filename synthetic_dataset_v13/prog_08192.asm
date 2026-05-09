; DESCRIPTION: Renders a red line between points (364, 102) and (338, 215).
; PLAN: r0=364(x1), r1=102(y1), r2=338(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 102
LDI r2, 338
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
