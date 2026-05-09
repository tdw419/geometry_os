; DESCRIPTION: Renders a red line between points (193, 71) and (202, 32).
; PLAN: r0=193(x1), r1=71(y1), r2=202(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 71
LDI r2, 202
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
