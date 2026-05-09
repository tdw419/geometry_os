; DESCRIPTION: Renders a yellow line between points (225, 75) and (410, 233).
; PLAN: r0=225(x1), r1=75(y1), r2=410(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 75
LDI r2, 410
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
