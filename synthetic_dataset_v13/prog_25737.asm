; DESCRIPTION: Renders a red line between points (231, 78) and (128, 76).
; PLAN: r0=231(x1), r1=78(y1), r2=128(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 78
LDI r2, 128
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
