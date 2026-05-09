; DESCRIPTION: Renders a red line between points (152, 249) and (459, 110).
; PLAN: r0=152(x1), r1=249(y1), r2=459(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 249
LDI r2, 459
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
