; DESCRIPTION: Renders a red line between points (74, 55) and (442, 43).
; PLAN: r0=74(x1), r1=55(y1), r2=442(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 55
LDI r2, 442
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
