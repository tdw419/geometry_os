; DESCRIPTION: Renders a yellow line between points (154, 2) and (417, 76).
; PLAN: r0=154(x1), r1=2(y1), r2=417(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 2
LDI r2, 417
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
