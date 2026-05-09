; DESCRIPTION: Renders a green line between points (28, 58) and (376, 101).
; PLAN: r0=28(x1), r1=58(y1), r2=376(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 58
LDI r2, 376
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
