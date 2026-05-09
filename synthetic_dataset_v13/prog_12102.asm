; DESCRIPTION: Places a yellow line segment connecting (506, 228) to (287, 93).
; PLAN: r0=506(x1), r1=228(y1), r2=287(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 228
LDI r2, 287
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
