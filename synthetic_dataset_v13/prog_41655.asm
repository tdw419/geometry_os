; DESCRIPTION: Renders a red line between points (391, 28) and (142, 187).
; PLAN: r0=391(x1), r1=28(y1), r2=142(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 28
LDI r2, 142
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
