; DESCRIPTION: Renders a green line between points (55, 56) and (380, 61).
; PLAN: r0=55(x1), r1=56(y1), r2=380(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 56
LDI r2, 380
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
