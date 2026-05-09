; DESCRIPTION: Renders a red line between points (320, 118) and (295, 84).
; PLAN: r0=320(x1), r1=118(y1), r2=295(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 118
LDI r2, 295
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
