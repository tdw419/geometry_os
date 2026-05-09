; DESCRIPTION: Renders a red line between points (304, 217) and (404, 125).
; PLAN: r0=304(x1), r1=217(y1), r2=404(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 217
LDI r2, 404
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
