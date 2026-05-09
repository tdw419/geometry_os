; DESCRIPTION: Renders a orange line between points (162, 255) and (473, 95).
; PLAN: r0=162(x1), r1=255(y1), r2=473(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 255
LDI r2, 473
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
