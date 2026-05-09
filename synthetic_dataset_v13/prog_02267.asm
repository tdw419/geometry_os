; DESCRIPTION: Renders a red line between points (110, 161) and (346, 104).
; PLAN: r0=110(x1), r1=161(y1), r2=346(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 161
LDI r2, 346
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
