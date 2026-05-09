; DESCRIPTION: Renders a red line between points (288, 117) and (69, 1).
; PLAN: r0=288(x1), r1=117(y1), r2=69(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 117
LDI r2, 69
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
