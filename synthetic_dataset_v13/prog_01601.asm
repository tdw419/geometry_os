; DESCRIPTION: Renders a red line between points (410, 77) and (257, 90).
; PLAN: r0=410(x1), r1=77(y1), r2=257(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 77
LDI r2, 257
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
