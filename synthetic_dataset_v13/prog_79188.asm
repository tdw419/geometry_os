; DESCRIPTION: Renders a red line between points (23, 5) and (435, 202).
; PLAN: r0=23(x1), r1=5(y1), r2=435(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 5
LDI r2, 435
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
