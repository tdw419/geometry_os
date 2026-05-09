; DESCRIPTION: Renders a red line between points (285, 195) and (86, 202).
; PLAN: r0=285(x1), r1=195(y1), r2=86(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 195
LDI r2, 86
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
