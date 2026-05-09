; DESCRIPTION: Places a green line segment connecting (290, 182) to (92, 84).
; PLAN: r0=290(x1), r1=182(y1), r2=92(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 182
LDI r2, 92
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
