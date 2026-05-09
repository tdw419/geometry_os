; DESCRIPTION: Renders a red line between points (355, 45) and (103, 28).
; PLAN: r0=355(x1), r1=45(y1), r2=103(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 45
LDI r2, 103
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
