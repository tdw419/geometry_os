; DESCRIPTION: Renders a red line between points (499, 135) and (367, 162).
; PLAN: r0=499(x1), r1=135(y1), r2=367(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 135
LDI r2, 367
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
