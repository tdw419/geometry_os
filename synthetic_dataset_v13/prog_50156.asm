; DESCRIPTION: Renders a yellow line between points (141, 243) and (265, 154).
; PLAN: r0=141(x1), r1=243(y1), r2=265(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 243
LDI r2, 265
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
