; DESCRIPTION: Renders a yellow line between points (410, 39) and (458, 22).
; PLAN: r0=410(x1), r1=39(y1), r2=458(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 39
LDI r2, 458
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
