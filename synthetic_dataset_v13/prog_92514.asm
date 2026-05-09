; DESCRIPTION: Renders a red line between points (446, 0) and (306, 73).
; PLAN: r0=446(x1), r1=0(y1), r2=306(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 0
LDI r2, 306
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
