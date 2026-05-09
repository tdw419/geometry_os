; DESCRIPTION: Renders a red line between points (217, 48) and (160, 216).
; PLAN: r0=217(x1), r1=48(y1), r2=160(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 48
LDI r2, 160
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
