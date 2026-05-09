; DESCRIPTION: Renders a red line between points (251, 186) and (240, 98).
; PLAN: r0=251(x1), r1=186(y1), r2=240(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 186
LDI r2, 240
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
