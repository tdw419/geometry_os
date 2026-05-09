; DESCRIPTION: Renders a yellow line between points (467, 34) and (140, 27).
; PLAN: r0=467(x1), r1=34(y1), r2=140(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 34
LDI r2, 140
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
