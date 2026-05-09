; DESCRIPTION: Renders a orange line between points (30, 58) and (95, 152).
; PLAN: r0=30(x1), r1=58(y1), r2=95(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 58
LDI r2, 95
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
