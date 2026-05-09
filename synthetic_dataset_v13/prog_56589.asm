; DESCRIPTION: Renders a red line between points (354, 240) and (210, 247).
; PLAN: r0=354(x1), r1=240(y1), r2=210(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 240
LDI r2, 210
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
