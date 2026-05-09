; DESCRIPTION: Renders a red line between points (355, 146) and (387, 122).
; PLAN: r0=355(x1), r1=146(y1), r2=387(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 146
LDI r2, 387
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
