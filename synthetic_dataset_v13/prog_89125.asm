; DESCRIPTION: Renders a red line between points (225, 183) and (327, 218).
; PLAN: r0=225(x1), r1=183(y1), r2=327(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 183
LDI r2, 327
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
