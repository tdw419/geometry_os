; DESCRIPTION: Renders a green line between points (412, 102) and (376, 68).
; PLAN: r0=412(x1), r1=102(y1), r2=376(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 102
LDI r2, 376
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
