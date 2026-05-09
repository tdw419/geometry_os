; DESCRIPTION: Renders a red line between points (380, 141) and (117, 81).
; PLAN: r0=380(x1), r1=141(y1), r2=117(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 141
LDI r2, 117
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
