; DESCRIPTION: Renders a yellow line between points (234, 233) and (334, 154).
; PLAN: r0=234(x1), r1=233(y1), r2=334(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 233
LDI r2, 334
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
