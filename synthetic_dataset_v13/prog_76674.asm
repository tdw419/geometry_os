; DESCRIPTION: Renders a red line between points (229, 83) and (76, 32).
; PLAN: r0=229(x1), r1=83(y1), r2=76(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 83
LDI r2, 76
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
