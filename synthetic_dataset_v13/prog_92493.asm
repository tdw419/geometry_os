; DESCRIPTION: Renders a yellow line between points (156, 193) and (344, 154).
; PLAN: r0=156(x1), r1=193(y1), r2=344(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 193
LDI r2, 344
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
