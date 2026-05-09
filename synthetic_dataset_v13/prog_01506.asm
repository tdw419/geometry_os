; DESCRIPTION: Renders a green line between points (290, 242) and (342, 245).
; PLAN: r0=290(x1), r1=242(y1), r2=342(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 242
LDI r2, 342
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
