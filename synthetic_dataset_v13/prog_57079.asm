; DESCRIPTION: Renders a green line between points (214, 87) and (489, 101).
; PLAN: r0=214(x1), r1=87(y1), r2=489(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 87
LDI r2, 489
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
