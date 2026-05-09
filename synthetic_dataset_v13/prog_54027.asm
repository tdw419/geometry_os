; DESCRIPTION: Renders a green line between points (152, 163) and (373, 100).
; PLAN: r0=152(x1), r1=163(y1), r2=373(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 163
LDI r2, 373
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
