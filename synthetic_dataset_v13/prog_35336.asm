; DESCRIPTION: Renders a red line between points (47, 162) and (113, 224).
; PLAN: r0=47(x1), r1=162(y1), r2=113(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 162
LDI r2, 113
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
