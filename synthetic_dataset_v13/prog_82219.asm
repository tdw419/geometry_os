; DESCRIPTION: Renders a red line between points (108, 20) and (440, 159).
; PLAN: r0=108(x1), r1=20(y1), r2=440(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 20
LDI r2, 440
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
