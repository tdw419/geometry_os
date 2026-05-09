; DESCRIPTION: Renders a red line between points (64, 184) and (424, 125).
; PLAN: r0=64(x1), r1=184(y1), r2=424(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 184
LDI r2, 424
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
