; DESCRIPTION: Renders a red line between points (324, 193) and (289, 196).
; PLAN: r0=324(x1), r1=193(y1), r2=289(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 193
LDI r2, 289
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
