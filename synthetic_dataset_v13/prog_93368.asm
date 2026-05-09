; DESCRIPTION: Renders a yellow line between points (139, 10) and (202, 32).
; PLAN: r0=139(x1), r1=10(y1), r2=202(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 10
LDI r2, 202
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
