; DESCRIPTION: Renders a yellow line between points (467, 140) and (506, 173).
; PLAN: r0=467(x1), r1=140(y1), r2=506(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 140
LDI r2, 506
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
