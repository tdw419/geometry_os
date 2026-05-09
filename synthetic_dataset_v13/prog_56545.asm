; DESCRIPTION: Renders a red line between points (244, 244) and (303, 26).
; PLAN: r0=244(x1), r1=244(y1), r2=303(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 244
LDI r2, 303
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
