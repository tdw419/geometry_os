; DESCRIPTION: Renders a red line between points (4, 1) and (20, 125).
; PLAN: r0=4(x1), r1=1(y1), r2=20(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 1
LDI r2, 20
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
