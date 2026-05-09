; DESCRIPTION: Renders a yellow line between points (154, 92) and (86, 1).
; PLAN: r0=154(x1), r1=92(y1), r2=86(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 92
LDI r2, 86
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
