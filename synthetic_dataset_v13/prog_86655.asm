; DESCRIPTION: Renders a red line between points (489, 104) and (420, 51).
; PLAN: r0=489(x1), r1=104(y1), r2=420(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 104
LDI r2, 420
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
