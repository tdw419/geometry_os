; DESCRIPTION: Renders a yellow line between points (101, 205) and (314, 228).
; PLAN: r0=101(x1), r1=205(y1), r2=314(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 205
LDI r2, 314
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
