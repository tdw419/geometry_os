; DESCRIPTION: Renders a red line between points (233, 31) and (371, 9).
; PLAN: r0=233(x1), r1=31(y1), r2=371(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 31
LDI r2, 371
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
