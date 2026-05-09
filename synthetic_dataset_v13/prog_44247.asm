; DESCRIPTION: Renders a red line between points (435, 16) and (410, 115).
; PLAN: r0=435(x1), r1=16(y1), r2=410(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 16
LDI r2, 410
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
