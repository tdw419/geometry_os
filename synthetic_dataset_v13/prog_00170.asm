; DESCRIPTION: Renders a green line between points (80, 118) and (346, 104).
; PLAN: r0=80(x1), r1=118(y1), r2=346(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 118
LDI r2, 346
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
