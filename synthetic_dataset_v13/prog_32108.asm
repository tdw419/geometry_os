; DESCRIPTION: Renders a yellow line between points (467, 20) and (102, 150).
; PLAN: r0=467(x1), r1=20(y1), r2=102(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 20
LDI r2, 102
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
