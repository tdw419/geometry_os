; DESCRIPTION: Renders a red line between points (410, 208) and (504, 189).
; PLAN: r0=410(x1), r1=208(y1), r2=504(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 208
LDI r2, 504
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
