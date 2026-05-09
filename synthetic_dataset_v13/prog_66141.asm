; DESCRIPTION: Renders a red line between points (87, 78) and (84, 86).
; PLAN: r0=87(x1), r1=78(y1), r2=84(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 78
LDI r2, 84
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
