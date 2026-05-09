; DESCRIPTION: Renders a red line between points (364, 151) and (29, 209).
; PLAN: r0=364(x1), r1=151(y1), r2=29(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 151
LDI r2, 29
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
