; DESCRIPTION: Renders a red line between points (373, 244) and (241, 134).
; PLAN: r0=373(x1), r1=244(y1), r2=241(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 244
LDI r2, 241
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
