; DESCRIPTION: Renders a red line between points (2, 4) and (482, 199).
; PLAN: r0=2(x1), r1=4(y1), r2=482(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 4
LDI r2, 482
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
