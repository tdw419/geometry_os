; DESCRIPTION: Renders a red line between points (482, 251) and (352, 2).
; PLAN: r0=482(x1), r1=251(y1), r2=352(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 251
LDI r2, 352
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
