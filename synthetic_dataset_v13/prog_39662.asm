; DESCRIPTION: Renders a red line between points (458, 143) and (272, 18).
; PLAN: r0=458(x1), r1=143(y1), r2=272(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 143
LDI r2, 272
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
