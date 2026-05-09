; DESCRIPTION: Renders a red line between points (254, 230) and (245, 96).
; PLAN: r0=254(x1), r1=230(y1), r2=245(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 230
LDI r2, 245
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
