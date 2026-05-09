; DESCRIPTION: Renders a red line between points (269, 50) and (91, 88).
; PLAN: r0=269(x1), r1=50(y1), r2=91(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 50
LDI r2, 91
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
