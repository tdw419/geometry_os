; DESCRIPTION: Renders a red line between points (131, 215) and (249, 191).
; PLAN: r0=131(x1), r1=215(y1), r2=249(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 215
LDI r2, 249
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
