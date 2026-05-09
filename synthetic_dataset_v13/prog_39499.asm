; DESCRIPTION: Renders a black line between points (482, 247) and (273, 246).
; PLAN: r0=482(x1), r1=247(y1), r2=273(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 247
LDI r2, 273
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
