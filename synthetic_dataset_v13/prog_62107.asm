; DESCRIPTION: Renders a yellow line between points (326, 153) and (376, 228).
; PLAN: r0=326(x1), r1=153(y1), r2=376(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 153
LDI r2, 376
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
