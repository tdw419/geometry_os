; DESCRIPTION: Renders a yellow line between points (449, 154) and (24, 30).
; PLAN: r0=449(x1), r1=154(y1), r2=24(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 154
LDI r2, 24
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
