; DESCRIPTION: Renders a red line between points (299, 13) and (248, 193).
; PLAN: r0=299(x1), r1=13(y1), r2=248(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 13
LDI r2, 248
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
