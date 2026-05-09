; DESCRIPTION: Renders a red line between points (225, 209) and (233, 168).
; PLAN: r0=225(x1), r1=209(y1), r2=233(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 209
LDI r2, 233
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
