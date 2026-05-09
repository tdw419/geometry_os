; DESCRIPTION: Renders a red line between points (230, 191) and (245, 81).
; PLAN: r0=230(x1), r1=191(y1), r2=245(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 191
LDI r2, 245
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
