; DESCRIPTION: Renders a red line between points (410, 149) and (498, 40).
; PLAN: r0=410(x1), r1=149(y1), r2=498(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 149
LDI r2, 498
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
