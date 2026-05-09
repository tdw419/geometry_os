; DESCRIPTION: Renders a red line between points (380, 68) and (222, 240).
; PLAN: r0=380(x1), r1=68(y1), r2=222(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 68
LDI r2, 222
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
