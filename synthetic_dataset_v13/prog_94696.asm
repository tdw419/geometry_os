; DESCRIPTION: Renders a red line between points (27, 160) and (217, 81).
; PLAN: r0=27(x1), r1=160(y1), r2=217(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 160
LDI r2, 217
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
