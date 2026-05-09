; DESCRIPTION: Renders a green line between points (467, 56) and (391, 24).
; PLAN: r0=467(x1), r1=56(y1), r2=391(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 56
LDI r2, 391
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
