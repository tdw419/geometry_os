; DESCRIPTION: Renders a red line between points (331, 138) and (391, 36).
; PLAN: r0=331(x1), r1=138(y1), r2=391(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 138
LDI r2, 391
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
