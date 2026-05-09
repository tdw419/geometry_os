; DESCRIPTION: Renders a green line between points (318, 127) and (469, 154).
; PLAN: r0=318(x1), r1=127(y1), r2=469(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 127
LDI r2, 469
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
