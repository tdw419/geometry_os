; DESCRIPTION: Renders a red line between points (425, 245) and (453, 124).
; PLAN: r0=425(x1), r1=245(y1), r2=453(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 245
LDI r2, 453
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
