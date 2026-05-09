; DESCRIPTION: Renders a red line between points (104, 160) and (167, 57).
; PLAN: r0=104(x1), r1=160(y1), r2=167(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 160
LDI r2, 167
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
